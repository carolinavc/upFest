const {queryDB} = require("../connection");

async function eventExists(id_evento) {
  const [evento] = await queryDB("SELECT * FROM evento WHERE id = ?", [id_evento]);
  return !!evento
}
// eventExists function with throw error
async function existeEvento(idEvento) {
  let [evento] = await queryDB('SELECT * FROM evento WHERE id = ?', [idEvento])

  if(evento === undefined) {      //não existe
    throw createError(`Evento com ID ${idEvento} não existe. É necessário inserir o ID de um evento válido.`,
      404) //erro not found
  }

  return evento
}
// Function for internal use only
// API exclusive
async function existsElementEvent (table, id, event) {
  // DANGER: table cannot be indicated by user
  // SQL insertion risk
  const sql = "SELECT * FROM `"+ table +"` WHERE id = ? AND evento = ?"
  const [el] = await queryDB(sql, [id, event]);
  return !!el
}
// For ticket payment validation
function generateCode() {
  const letras = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  let code = '';

  for (let i = 0; i < 6; i++) {
    const position = Math.floor(Math.random() * letras.length);
    code += letras.charAt(position);
  }
  return code;
}

async function getPayment(referencia, entidade, valor) {
  const queryP = `
  SELECT pag.* , b.id as bilheteID, pcs.*, b.codigo
  FROM pagamento pag
  LEFT JOIN bilhete b ON b.pagamento = pag.id
  LEFT JOIN pagamento_cashless pcs ON pcs.pagamento = pag.id
  WHERE referencia = ? AND entidade = ? AND valor = ?`
  const [pagamento] = await queryDB(queryP,[referencia, entidade, valor])
  if (!pagamento) {
    return null;
  }
  return pagamento
}

// carregamentos
async function geraRef() {
  let ref
  let numeroIndisponivel = true
  while (numeroIndisponivel) {
    ref = Math.floor(Math.random() * 900000000) + 100000000; // always 9 digits from 100000000 to 999999999
    const [num] = await queryDB('SELECT referencia FROM pagamento WHERE referencia = ?', [ref])
    if(!num) numeroIndisponivel = false
  }
  return ref
}

// error
function createError(message, status) {
  let e = new Error(message)
  e.status = status
  return e
}
// comerciante
async function existeComerciante(idComerciante) {
  let [comerciante] = await queryDB('SELECT * FROM comerciante WHERE id = ?', [idComerciante])

  if(comerciante === undefined) {      //não existe
    throw createError(`Comerciante com ID ${idComerciante} não existe. É necessário inserir o ID de um comerciante válido.`,
      404) // erro not found
  }

  return comerciante
}
// produto
async function existeProduto(idProduto) {
  let [produto] = await queryDB('SELECT * FROM produto_comerciante WHERE id = ?', [idProduto])

  if(produto === undefined) {      //não existe
    throw createError(`Produto com ID ${idProduto} não existe. É necessário inserir o ID de um produto válido.`,
      404) // erro not found
  }

  return produto
}

// participante
async function existeParticipante(emailParticipante) {
  let [participante] = await queryDB('SELECT * FROM participante WHERE email = ?', [emailParticipante])

  if(participante === undefined) {      //não existe
    throw createError(`Participante com email ${emailParticipante} não existe. É necessário inserir o email de um participante válido.`,
      404) // erro not found
  }

  return participante
}

module.exports = {
  eventExists,
  existsElementEvent,
  generateCode,
  getPayment,
  geraRef,
  createError,
  existeEvento,
  existeComerciante,
  existeProduto,
  existeParticipante }