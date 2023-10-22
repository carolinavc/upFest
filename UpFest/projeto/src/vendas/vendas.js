const {queryDB, connection} = require("../connection");
const express = require('express');
const router = express.Router();

const Messagemaker = require('../util/msgmaker')
const msg = new Messagemaker()
const {
  generateCode,
  getPayment,
  createError
} = require('../util/utilFunctions')

////////////////////////////////////////////////////////////////////////////////

////// 2. Gestão de bilhetes: participante, bilhete, validação de entrada, pagamento do bilhete; //////

// bilhetes

/* POST comprar: http://localhost:3000/vendas/bilhetes/comprar
    Permite a um utilizador adquirir um bilhete. Enviando o nome, o e-mail, e a série de bilhetes que quer adquirir, o servidor:
1. Deverá validar se ainda existem bilhetes disponíveis nessa série, e se essa série ainda está disponível para venda;
2. Verificar se já existe algum participante com esse e-mail e criar caso não exista, guardando também o nome do participante
3. Deverá gerar uma referência de pagamento
4. Deverá criar um bilhete, sem código de entrada, uma vez que ainda não foi pago.
*/

router.post('/bilhetes/comprar', async function (req, res) {
  try {
    // Número de entidade para os pagamentos (pode ser personalizado)
    const entidade = 11201;
    const {evento, nome, email, serie} = req.body;
    const successMessages = []; // Array para armazenar mensagens de sucesso

    // Passo 1: Valida a série do bilhete e a disponibilidade do mesmo
    const serieQuery = `
            SELECT *
            FROM serie_bilhetes
            WHERE numero_bilhetes > 0
              AND limite_vendas >= CURDATE()
              AND id = ?
        `;

    // Executa uma consulta SQL para verificar se a série selecionada existe e se ainda existem bilhetes disponíveis.
    const [serieAvailable] = await queryDB(serieQuery, [serie]);

    // Verifica se a série selecionada existe e tem bilhetes disponíveis.
    if (!serieAvailable) {
      // Caso contrário, retorna uma resposta com status 400 indicando que a série não está disponível para compra.
      throw createError(`A série selecionada não está disponível para compra ou não existe. Verifique a série e tente novamente`, 400);
    }

    // Define o custo a ser pago com base na série selecionada
    const {custo} = serieAvailable;

    // Passo 2: Verifica se o participante com o email fornecido existe ou cria um novo
    let participantId;
    let participantExists = false;

    // Executa uma consulta para verificar se um participante com o mesmo email já existe no banco de dados.
    const participantCheck = await queryDB('SELECT id FROM participante WHERE email = ?', [email]);

    if (participantCheck.length > 0) {
      // Se um participante com o mesmo email for encontrado, obtém o seu ID e define que o participante existe.
      participantId = participantCheck[0].id;
      participantExists = true;
    }

    if (!participantExists) {
      // Se o participante não existir, cria um novo participante com o nome e email fornecidos.
      const createParticipant = await queryDB('INSERT INTO participante SET nome = ?, email = ?, data_registo = now()', [nome, email]);
      if (createParticipant.affectedRows === 0) {
        // Caso a criação do participante falhe, retorna uma resposta de erro com status 500.
        throw createError(`Falha ao criar um novo participante.`, 500);
      }
      // Obtém o ID do novo participante criado e adiciona uma mensagem de sucesso.
      participantId = createParticipant.insertId;
      successMessages.push('Novo participante criado com sucesso!');
    }

    // Passo 3: Gera uma referência de pagamento única
    let paymentReference = 0;
    let referenceNotUnique = true;

    while (referenceNotUnique) {
      // Gera uma referência de pagamento com 9 dígitos aleatórios.
      paymentReference = Math.floor(Math.random() * 900000000) + 100000000;
      // Verifica se a referência gerada já existe no banco de dados.
      const existingReference = await queryDB('SELECT referencia FROM pagamento WHERE referencia = ?', [paymentReference]);

      if (!existingReference.length) {
        // Se a referência gerada não existir, marca que é única e encerra o loop.
        referenceNotUnique = false;
      }
    }

    // Cria uma nova entrada de pagamento na tabela de pagamentos com a referência única gerada.
    const createPaymentQuery = `
            INSERT INTO pagamento (entidade, referencia, valor, data_compra)
            VALUES (?, ?, ?, NOW())
        `;

    const createPaymentResult = await queryDB(createPaymentQuery, [entidade, paymentReference, custo]);

    if (!createPaymentResult.insertId) {
      // Caso a criação da entrada de pagamento falhe, retorna uma resposta de erro com status 500.
      throw createError(`Erro ao gerar uma referência de pagamento única.`, 500);
    }
    // Obtém o ID da entrada de pagamento criada e adiciona uma mensagem de sucesso.
    const paymentId = createPaymentResult.insertId;
    successMessages.push(`Referência de pagamento criada com sucesso: entidade - ${entidade}, referência - ${paymentReference}, custo - ${custo}`);

    // Passo 4: Cria uma nova entrada de bilhete na tabela de bilhetes com o código inicialmente nulo.
    const createTicketQuery = `
            INSERT INTO bilhete (participante, evento, serie, codigo, pagamento)
            VALUES (?, ?, ?, NULL, ?)
        `;

    const createTicketResult = await queryDB(createTicketQuery, [participantId, evento, serie, paymentId]);

    if (!createTicketResult.insertId) {
      // Caso a criação do bilhete falhe, retorna uma resposta de erro com status 500.
      throw createError(`Erro ao criar um novo bilhete.`, 500);
    }
    // Adiciona uma mensagem de sucesso indicando que o bilhete foi comprado com sucesso.
    successMessages.push('Bilhete comprado com sucesso!');

    // Passo 5: Atualiza a contagem de bilhetes para a série selecionada
    const updateTicketCountQuery = `
            UPDATE serie_bilhetes
            SET numero_bilhetes = numero_bilhetes - 1
            WHERE id = ?
        `;

    const updateTicketCountResult = await queryDB(updateTicketCountQuery, [serie]);

    if (updateTicketCountResult.affectedRows === 0) {
      // Caso a atualização do número de bilhetes disponíveis falhe, retorna uma resposta de erro com status 400.
      throw createError(`Erro ao atualizar o número de bilhetes disponíveis na série selecionada.`, 400);
    }

    // Responde com as mensagens de sucesso e informações adicionais.
    res.status(200).json({successMessages: successMessages});
  } catch (e) {
    res.status(e.status)
    res.send({message: e.message, status: e.status})
  }
});

/* POST validar_entrada: http://localhost:3000/vendas/bilhetes/validar_entrada
    A ser utilizado pela organização do evento para validar a entrada de um participante. Deverá receber o código do bilhete gerado no momento em que o bilhete foi pago.
1. Validar se o bilhete existe e foi pago;
2. Validar se não foi já registada uma entrada no evento nesse dia, para esse bilhete;
3. Registar a entrada no evento.
 */

router.post('/bilhetes/validar_entrada', async function (req, res, next) {
  try {
    const {evento, codigo} = req.body;

    // Passo 1: Consulta a base de dados para obter informações do bilhete com base no evento e código
    const queryBilhete = `SELECT b.id as id, e.id as entrada
                              FROM bilhete b
                                       LEFT JOIN entrada e ON e.bilhete = b.id
                              WHERE b.evento = ?
                                AND b.codigo = ?`;

    // Executa uma consulta SQL para obter informações sobre o bilhete com base no evento e código fornecidos.
    const [bilhete] = await queryDB(queryBilhete, [evento, codigo]);

    // Passo 2: Verificar se o bilhete não existe ou não foi pago
    if (!bilhete) {
      // Se o bilhete não for encontrado, responde com um status 400, indicando que o bilhete não existe ou não foi pago.
      throw createError(`Bilhete não existe ou não foi pago. Verifique o nº do bilhete ${codigo}`, 400);
    }

    // Passo 3: Verificar se o bilhete já foi validado (entrada registada previamente)
    if (bilhete.entrada) {
      // Se o bilhete já tiver uma entrada registrada, responde com um status 409, indicando um conflito.
      throw createError(msg.conflict('entrada'),409) // resposta de erro 409 - Conflito
    }

    // Passo 4: Registar a entrada no evento (data e hora atual)
    const creation = await queryDB('INSERT INTO entrada SET bilhete = ?, data = CURDATE(), hora = CURTIME()', [bilhete.id]);

    // Verificar se o registo de entrada foi bem-sucedido
    if (creation.affectedRows === 0) {
      // Se o registo de entrada falhar, responde com um status 500, indicando um erro interno.
      throw createError(msg.createErr('entrada'),500); // resposta de erro 500 - Erro interno
    }

    // Passo 5: Enviar a mensagem de sucesso em formato JSON
    res.status(201).json('Entrada validada com sucesso!');
  } catch (e) {
    res.status(e.status)
    res.send({message: e.message, status: e.status})
  }
});

////////////////////////////////////////////////////////////////////////////////

// participantes

/*  GET listar: http://localhost:3000/vendas/participantes/listar?evento=1
    Lista os participantes inscritos no evento que fizeram o pagamento, e se já deram entrada no evento ou não.
*/

router.get('/participantes/listar', async function (req, res, next) {
  try {
    let {evento} = req.query;

    // Consulta SQL para obter a lista de participantes que entraram ou não no evento.
    // A consulta junta as tabelas 'participante', 'bilhete' e 'entrada' para determinar se cada participante entrou ou não no evento.
    let participantes = `
            SELECT p.nome  AS Nome,
                   CASE
                       WHEN e.id IS NOT NULL THEN 'Entrou'
                       ELSE 'Não entrou'
                       END AS Entrada
            FROM participante p
                     INNER JOIN bilhete b ON p.id = b.participante
                     LEFT JOIN entrada e ON e.bilhete = b.id
            WHERE b.codigo IS NOT NULL
              AND evento = ?;
        `;

    // Executa a consulta SQL no banco de dados usando a variável 'evento' como parâmetro.
    let lista_Participantes = await queryDB(participantes, [evento]);

    if (lista_Participantes.length === 0) {
      // Se a lista de participantes estiver vazia, significa que não há participantes para o evento especificado.
      // Retorna uma mensagem indicando que o evento não possui participantes.
      res.json('Evento sem participantes');
      return;
    }

    // Retorna a lista de participantes no formato de um objeto JSON.
    // Cada participante é representado com seu nome e status de entrada ('Entrou' ou 'Não entrou').
    res.json({'Lista participantes': lista_Participantes});
  } catch (e) {
    res.status(e.status)
    res.send({message: e.message, status: e.status})
  }
});

////////////////////////////////////////////////////////////////////////////////

// pagamentos

/* GET listar: http://localhost:3000/vendas/pagamentos/listar?participante=joao.sousa@gmail.com
    Lista todos os pagamentos associados a um participante, indicando o respetivo estado (pendentes ou pagos). Será útil para o participante confirmar se tem algum pagamento por finalizar.
 */

router.get('/pagamentos/listar', async function (req, res) {
  try {
    let {participante} = req.query;

    // Consulta SQL para obter a lista de pagamentos de um participante, incluindo status de validação e pagamento
    const pagamentos = `
        SELECT pa.nome         AS Nome,
               p.data_validado AS Data_Validacao,
               CASE
                   WHEN p.data_validado IS NOT NULL THEN 'Pago'
                   ELSE 'Pendente'
                   END         AS Status_Validacao,
               CASE
                   WHEN p.data_compra IS NOT NULL THEN 'Pago'
                   ELSE 'Não pago'
                   END         AS Status_Pagamento,
               p.entidade, p.referencia, p.valor
        FROM pagamento p
                 INNER JOIN bilhete b ON b.pagamento = p.id
                 INNER JOIN participante pa ON pa.id = b.participante
        WHERE pa.email = ?`;

    // Executa a consulta SQL no banco de dados usando o email do participante como parâmetro.
    let lista_pagamentos = await queryDB(pagamentos, [participante]);

    if (lista_pagamentos.length === 0) {
      // Se a lista de pagamentos estiver vazia, significa que o participante não possui pagamentos registrados.
      // Retorna uma mensagem indicando que o participante não possui pagamentos.
      res.json('Participante sem pagamentos');
      return;
    }

    // Retorna a lista de pagamentos no formato de um objeto JSON.
    // Cada pagamento é representado com o nome do participante, data de validação e status de validação e pagamento.
    res.json({"Participante": participante, "Lista pagamentos": lista_pagamentos});

  } catch (e) {
    res.status(e.status)
    res.send({message: e.message, status: e.status})
  }
});

/* POST validar_pagamento: http://localhost:3000/vendas/pagamentos/validar
Endpoint chamado para validar pagamentos de compra de bilhete ou pagamentos de carregamento cashless.
    Quando este endpoint é chamado:
1. Verificar se o código existe (referência, entidade e valor);
2. Verificar se o pagamento ainda não foi validado;
3. Verificar se é um pagamento de bilhete (verificar se está na tabela de bilhete) ou cashless (verificar a tabela pagamento_cashless);
4. Se for um pagamento de bilhete, verificar se o bilhete já foi validado. Caso contrário, gerar código aleatório do bilhete para ser usado na validação de entrada;
5. Se for um carregamento cashless retornar um erro a avisar que deverá ser utilizado o endpoint /cashless/validar_pagamento
*/

// Rota para validar um pagamento e gerar um código de bilhete único, se necessário
router.post('/pagamentos/validar', async function (req, res, next) {
  const {entidade, referencia, valor} = req.body;
  let codigo;

  try {
    const pagamento = await getPayment(referencia, entidade, valor);

    if (!pagamento) {
      // Se o pagamento não for encontrado, lança um erro com status 400.
      throw createError('Pagamento não encontrado, verifique os dados inseridos', 400)
    }
    if (pagamento.pagamento) { // cashless
      // Se o pagamento for do tipo "cashless", lança um erro com status 400.
      throw createError(`Deverá validar pagamentos cashless em /cashless/validar_pagamento`, 400);
    }

    if (pagamento.data_validado !== null) {
      // Se o pagamento não tiver sido validado, lança um erro com status 400.
      throw createError(`Pagamento de ref ${referencia} já foi validado`, 400)
    }

    const validaPagamento = await queryDB(`UPDATE pagamento SET data_validado = NOW() WHERE id = ?`, [pagamento.id])
    if (validaPagamento.affectedRows === 0) {
      // Se a atualização do código falhar, lança um erro com status 500.
      throw createError(`Erro ao validar pagamento.`, 500)
    }

    let unavailable = true;
    while (unavailable) {
      codigo = generateCode(); // Implemente sua lógica de geração de código aqui
      const [repeated] = await queryDB('SELECT id FROM bilhete WHERE codigo = ?', [codigo]);

      if (!repeated) {
        unavailable = false;
      }
    }

    // Atualiza o código na tabela de bilhetes com base no status do data_validado.
    const updateCode = await queryDB('UPDATE bilhete SET codigo = ? WHERE id = ?', [codigo, pagamento.bilheteID]);

    if (updateCode.affectedRows === 0) {
      // Se a atualização do código falhar, lança um erro com status 500.
      throw createError(`Erro ao atualizar o código do bilhete. Informe o pagamento com a ref ${referencia} para a equipa suporte`, 500)
    }

    //
    res.status(200).send(`Pagamento validado com sucesso. Bilhete com o código ${codigo}`);
  } catch (e) {
    res.status(e.status)
    res.send({message: e.message, status: e.status})
  }
});

////////////////////////////////////////////////////////////////////////////////

module.exports = router;