const { queryDB } = require("../connection");
const express = require("express");
const { getPayment, geraRef, eventExists, createError } = require("../util/utilFunctions"); // err f EDIT
const router = express.Router();
const Messagemaker = require('../util/msgmaker')
const msg = new Messagemaker()
const ExcelJS = require('exceljs')

// CARREGAMENTOS
// Saldo
router.get("/:id_evento/saldo", async function(req, res, next) {
  const { id_evento } = req.params
  const { participante: email } = req.query

  try {
    // verify if event exists
    if(!await eventExists( id_evento )) {
      throw createError(msg.notFound('evento'),404) // not found
    }
    // verify if participant exists
    const [participante] = await queryDB(`SELECT * FROM participante WHERE email = ?`, [email])
    if(!participante) {
      throw createError(msg.notFound('participante'),404) // not found
    }
    const { id: idParticipante } = participante
    // search account
    const [conta] = await queryDB(`SELECT valor_atual as saldo FROM conta_cashless
                                     WHERE participante = ? AND evento = ?`, [idParticipante,id_evento]);
    if(!conta) {
      throw createError(msg.notFound('conta'),404) // not found
    }
    res.status(200).json(conta); // ok
  } catch (e) {
    const { status, message } = e
    res.status(status).send(message)
  }
})
// Extrato - Excel
router.get('/:id_evento/extrato', async function(req, res, next) {
  const { id_evento } = req.params
  const { participante: email, excel } = req.query

  try {
    // verify if event exists
    if(!await eventExists( id_evento )) {
      throw createError(msg.notFound('evento'),404) // not found
    }
    // verify if participant exists
    const [participante] = await queryDB(`SELECT * FROM participante WHERE email = ?`, [email])
    if(!participante) {
      throw createError(msg.notFound('participante'),404) // not found
    }
    const { id: idParticipante, nome } = participante
    // search for user account
    const [conta] = await queryDB(`SELECT * FROM conta_cashless
                                     WHERE participante = ? AND evento = ?`, [idParticipante,id_evento]);
    if(!conta) {
      throw createError(msg.notFound('conta'),404)
    }
    const { id: contaID } = conta
    // carregamentos
    const carregamentos = await queryDB(`SELECT id, tipo, valor, saldo, data FROM movimento_cashless
                                        WHERE tipo = 'carregamento' AND conta = ? ORDER BY data DESC`, [contaID])
    // gastos
    const queryGasto = `
  SELECT mcs.id, mcs.tipo, gcs.quantidade, pc.designacao as produto,
  c.designacao as comerciante, gcs.valor_unitario, mcs.saldo, mcs.data
  FROM movimento_cashless mcs
  JOIN gasto_cashless gcs ON gcs.movimento = mcs.id
  JOIN produto_comerciante pc ON pc.id = gcs.produto
  JOIN comerciante c ON c.id = pc.comerciante
  WHERE mcs.conta = ?
  ORDER BY mcs.data DESC`
    const gastos = await queryDB(queryGasto,[contaID])
    const extrato = [
      ...carregamentos,
      ...gastos
    ]
    extrato.sort((a,b) => (new Date(a.data) < new Date(b.data)) ? 1 : -1) // DESC
    // verify if Excel sheet should be exported
    if(excel) {
      const workbook = new ExcelJS.Workbook();
      // creat sheet
      const worksheet = workbook.addWorksheet('extrato')
      let cols = []
      if(carregamentos[0]) cols.push(...Object.keys(carregamentos[0])) // get keys of carregamento
      if(gastos[0]) cols.push(...Object.keys(gastos[0])) // get keys of gastos
      const columnSet = new Set(cols) // remove duplicate keys
      let worksheetConfig = []
      for (const column of columnSet) {
        // add column to config list
        worksheetConfig = [
          ...worksheetConfig,
          {header: column, key: column},
        ]
      }
      // create columns
      worksheet.columns = worksheetConfig
      // add row
      for(const movimento of extrato) {
        worksheet.addRow(movimento)
      }
      await workbook.xlsx.writeFile(`extrato_${nome}.xlsx`)
    }
    res.status(200).json(extrato) // ok
  } catch (e) {
    const { status, message } = e
    res.status(status).send(message)
  }
})
// Carregar
router.post('/:id_evento/carregar', async function(req, res, next) {
  const { participante, valor } = req.body
  const { id_evento } = req.params
  const entidade = 11201

  try {
    // busca participante
    const [participanteData] = await queryDB('SELECT * FROM participante WHERE email = ?',[participante])
    // Verifica se participante possui conta naquele evento e criar se não existir
    const queryConta = `SELECT * FROM conta_cashless WHERE participante = ? AND evento = ?`
    const [conta] = await queryDB(queryConta, [participanteData.id, id_evento])
    let contaID;
    if(!conta) {
      const criaConta = await queryDB(`INSERT INTO conta_cashless SET participante = ?, evento = ?, valor_atual = 0`, [participanteData.id, id_evento])
      if(criaConta.affectedRows === 0) {
        throw createError(msg.createErr('conta cashless'),500) // internaal err
      }
      contaID = criaConta.insertId
    } else {
      contaID = conta.id
    }
    // Gerar referência de pagamento aleatória e guardar na tabela pagamento
    const ref = await geraRef()
    const pagamento = await queryDB(`INSERT INTO pagamento SET entidade = ?, referencia = ?, valor = ?, data_compra = NOW()`,
      [entidade, ref, valor])
    const { insertId: idPag } = pagamento
    if(pagamento.affectedRows === 0) {
      throw createError(msg.createErr('pagamento'),500)
    }
    // cria pagamento_cashless
    const pagCashless = await queryDB('INSERT INTO pagamento_cashless SET pagamento = ?, conta = ?',[idPag,contaID])
    if(pagCashless.affectedRows === 0) {
      throw createError(msg.createErr('associação entre pagamento e conta do utilizador'),500)
    }
    // devolve fatura
    res.status(200).json(await queryDB('SELECT entidade, referencia, valor FROM pagamento WHERE id = ?', [idPag])) // ok
  } catch (e) {
    const { status, message } = e
    res.status(status).send(message)
  }
})
// Validar pagamento
router.post('/validar_pagamento', async function(req, res, next) {
  const { entidade, referencia, valor } = req.body
  try {
    // Procura pagamento
    const pagamento = await getPayment(referencia,entidade,valor)
    if(!pagamento) {
      throw createError(msg.notFound('pagamento'),404)
    }
    console.log(pagamento)
    if(pagamento.data_validado) {
      throw createError('Pagamento já foi validado', 400) // bad request
    }
    const { conta: contaID, data_validado: validado, bilheteID, pagamento: cashless , id: idPag } = pagamento
    // Verifica se foi validado
    if(validado) {
      throw createError(msg.conflict('Validação'),409)
    }
    // Verifica se é pagamento de bilhete
    if(bilheteID) {
      throw createError("Deverá ser utilizado o endpoint /vendas/pagamentos/validar",400) // bad request
    }
    if(!cashless) {
      throw createError(msg.notFound('pedido de carregamento'),404)
    }
    // procura conta cashless
    const [conta] = await queryDB('SELECT valor_atual as saldo from conta_cashless WHERE id = ?', [contaID])
    // cria movimento_cashless // PROCEDURE?
    //  indicando o id da conta cashless e registando o valor e novo saldo;
    const novoSaldo = conta.saldo + valor
    const criaMovimentocs = await queryDB(`INSERT INTO movimento_cashless SET tipo = 'carregamento',
                               conta = ?, valor = ?, saldo = ?, data = NOW()`,
      [contaID, valor, novoSaldo])
    if(criaMovimentocs.affectedRows === 0) {
      throw createError(msg.createErr('movimento cashless'),500)
    }
    // Criar um carregamento_cashless
    const criaCarregamento = await queryDB(`INSERT INTO carregamento_cashless SET movimento = ?, pagamento = ?`,
      [criaMovimentocs.insertId, idPag])
    if(criaCarregamento.affectedRows === 0) {
      throw createError('Movimento criado. Falha ao criar carregamento associado.',500) // internal err
    }
    // Atualizar valor atual de saldo na tabela conta_cashless
    const atualizaConta = await queryDB('UPDATE conta_cashless SET valor_atual = ? WHERE id = ?', [novoSaldo, contaID])
    if(atualizaConta.affectedRows === 0) {
      throw createError(msg.updateErr('valor disponível em conta'),500)
    }
    await queryDB('UPDATE pagamento SET data_validado = NOW() where id = ?', pagamento.id)
    res.status(200).send(`${msg.update('saldo', false)}. Saldo atual: ${novoSaldo}`) // ok
  } catch (e) {
    const { status, message } = e
    res.status(status).send(message)
  }
})

module.exports = router;