const {queryDB} = require("../connection");
const { eventExists, existsElementEvent, createError } = require("../util/utilFunctions")
const express = require("express");

const router = express.Router();                  // Define Rotas e manipulação de solicitações URL

const Messagemaker = require('../util/msgmaker')  // Template de Mensagens
const msg = new Messagemaker()


// - - - - - - - - - -
// EVENTOS
// - - - - - - - - - -



// CRIAR EVENTO
router.post("/criar", async function(req, res, next) {
  const { designacao } = req.body
  const [evento] = await queryDB("SELECT * FROM evento WHERE designacao = ?", [designacao]);

  try {
    // VERIFICAÇÂO
    // Caso já exista um evento retorna um erro 404 e termina a função
    if(evento) {
      throw createError(msg.conflict('evento'),409); // Mensagem erro
    }

    // Caso não exista um cria evento
    const creation = await queryDB("INSERT INTO evento SET designacao = ?", [designacao])

    // Verifica se pelo menos uma linha foi criada
    if(creation.affectedRows === 0) {
      throw createError(msg.createErr('evento'),500); // Mensagem erro
    }

    const [eventCreated] = await queryDB('SELECT * FROM evento WHERE id = ?',[creation.insertId])

    res.status(201).send(eventCreated) // Mensagem sucesso

  } catch (e) {
    const { status, message } = e
    res.status(status).send(message)
  }
})




// EDITAR EVENTO
router.post('/:id_evento/editar', async function (req, res, next){
  const { id_evento } = req.params
  const { designacao } = req.body

  // VERIFICAÇÂO
  try{
    // Caso não exista um evento retorna um erro 404 e termina a função
    if(!await eventExists(id_evento)) {
      throw createError(msg.notFound('evento'),404); // Mensagem erro
    }

    // Caso o evento já exista faz update da designação
    const update = await queryDB("UPDATE evento SET designacao = ? WHERE id = ?", [designacao, id_evento])

    // Verifica se pelo menos uma linha foi editada
    if(update.affectedRows === 0) {
      throw createError(msg.updateErr('evento'),500); // Mensagem erro
    }
    const [eventUpdated] = await queryDB('SELECT * FROM evento WHERE id = ?', [id_evento])

    res.status(200).send(eventUpdated) // Mensagem sucesso

  }catch (e){
    const { status, message } = e
    res.status(status).send(message)
  }
})



// LISTAR EVENTOS
router.get('/listar', async function (req, res, next){
  try{
    const eventos = await queryDB('SELECT * FROM evento');
    if(!eventos) {
      throw createError(msg.createErr('evento'),404); // Mensagem erro
    }
    res.status(200).json(eventos)   // Mensagem sucesso
  }catch(e){
    const { status, message } = e
    res.send(message)
  }
})




// - - - - - - - - - -
// PALCOS
// - - - - - - - - - -

// CRIAR PALCO
router.post('/:id_evento/palco/criar', async function (req, res, next){
  const { id_evento } = req.params
  const { designacao } = req.body

  // VERIFICAÇÂO
  try{
    // Caso não exista o evento retorna um erro 404 e termina a função
    if(!await eventExists(id_evento)) {
      throw createError(msg.notFound('palco'),404); // Mensagem erro
    }

    // Caso o palco já exista o evento retorna um erro 404 e termina a função
    const [palco] = await queryDB("SELECT * FROM palco WHERE designacao = ? AND evento = ?", [designacao, id_evento]);
    if(palco) {
      throw createError(msg.conflict('palco'),409); // Mensagem erro Coflito
    }


    // Caso o palco não exista cria um novo
    const creation = await queryDB("INSERT INTO palco SET designacao = ?, evento = ?", [designacao, id_evento])
    // Verifica se pelo menos uma linha foi criada
    if(creation.affectedRows === 0) {
      throw createError(msg.createErr('palco'),500) // Mensagem de erro interno
    }
    const [createdStage] = await queryDB('SELECT id, designacao FROM palco WHERE id = ?', [creation.insertId])

    res.status(201).send(createdStage) // Mensagem de Sucesso

  }catch(e){
    const { status, message } = e
    res.status(status).send(message)
  }
});



// EDITAR PALCO
router.post('/:id_evento/palco/:id_palco/editar', async function (req, res, next){
  const { id_evento, id_palco } = req.params
  const { designacao } = req.body


  // VERIFICAÇÂO
  try{

    // Caso não exista o palco retorna um erro 404 e termina a função
    const palco = await existsElementEvent("palco", id_palco, id_evento)
    if(!palco) {
      throw createError(msg.notFound('palco'),404); // Mensagem erro
    }

    // Caso o palco já exista retorna um erro 404 e termina a função
    const update = await queryDB("UPDATE palco SET designacao = ? WHERE id = ?", [designacao, id_palco])

    if (update.affectedRows === 0) {
      throw createError(msg.updateErr('palco'),500)// Mensagem de erro Interno
    }

    const [stageUpdated] = await queryDB('SELECT id, designacao FROM palco WHERE id = ?',[id_palco])

    res.status(200).send(stageUpdated); // Mensagem de Sucesso

  }catch(e){
    const { status, message } = e
    res.status(status).send(message)
  }

});




// LISTAR PALCOS
router.get('/:id_evento/palco/listar', async function (req, res, next){
  const { id_evento } = req.params


  try{

    // Caso o evento não exista retorna um erro 404 e termina a função
    if(!await eventExists(id_evento)) {
      throw createError(msg.notFound('palco'),404); // Mensagem erro
    }
    // Lista palcos
    const palcos = await queryDB('SELECT id, designacao FROM palco WHERE evento = ?', [id_evento])


    res.status(200).json(palcos)   // Mensagem sucesso


  }catch(e){
    const { status, message } = e
    res.status(status).send(message)
  }

});





// - - - - - - - - - -
// SERIE BILHETES
// - - - - - - - - - -

// CRIAR SERIE BILHETES
router.post('/:id_evento/series_bilhetes/criar', async function (req, res, next){
  const { id_evento } = req.params
  const { designacao, numero_bilhetes, limite_vendas, custo } = req.body

  // VERIFICAÇÂO

  try{

    // Caso a serie não exista retorna um erro 404 e termina a função
    if(!await eventExists( id_evento )) {
      throw createError(msg.notFound('evento'),404); // Mensagem erro

    }

    // Caso a serie de bilhetes já exista retorna um erro 409 e termina a função
    const [series] = await queryDB(`SELECT s.* FROM serie_bilhetes s 
                                        JOIN evento e ON s.evento = e.id 
                                        WHERE s.designacao = ? AND e.id = ?`, [designacao, id_evento])
    if(series) {
      throw createError(msg.conflict('series_bilhetes'),409); // Mensagem erro
    }


    // Caso a serie ainda não exista cria a serie de Bilhetes
    const creation = await queryDB("INSERT INTO serie_bilhetes SET evento = ?, designacao = ?, numero_bilhetes = ?, limite_vendas = ?, custo = ?",
      [id_evento, designacao, numero_bilhetes, limite_vendas, custo])

    // Verifica se pelo menos uma linha foi criada
    if(creation.affectedRows === 0) {
      throw createError(msg.createErr('série'),500) // Mensagem de Erro
    }
    const [createdSerie] = await queryDB('SELECT id, designacao, numero_bilhetes, limite_vendas, custo FROM serie_bilhetes WHERE id = ?',[creation.insertId])
    res.status(201).send(createdSerie) // Mensagem de Sucesso
  }catch(e){
    const { status, message } = e
    res.status(status).send(message)
  }
})



// EDITAR SERIE BILHETES
router.post('/:id_evento/series_bilhetes/:id_serie/editar', async function (req, res, next){
  const { id_evento, id_serie } = req.params
  const { designacao, numero_bilhetes, limite_vendas, custo } = req.body

  // VERIFICAÇÂO
  try{
    // Caso a serie não exista retorna um erro 404 e termina a função
    const series = await existsElementEvent("serie_bilhetes",id_serie,id_evento)
    if(!series) {
      throw createError(msg.notFound('série'),404); // Mensagem de erro página não encontrada

    }

    // Caso a serie exista faz update
    const update = await queryDB(`UPDATE serie_bilhetes SET designacao = ?, numero_bilhetes = ?, limite_vendas = ?, custo = ? WHERE id = ?`,
      [designacao,numero_bilhetes,limite_vendas,custo,id_serie])
    if (update.affectedRows === 0) {
      throw createError(msg.updateErr('série'),500) // Mensagem de erro interno
    }
    const [updatedSerie] = await queryDB('SELECT id, designacao, numero_bilhetes, limite_vendas, custo FROM serie_bilhetes WHERE id = ?',[id_serie])

    res.status(200).send(updatedSerie); // Mensagem de sucesso
  }catch(e){
    const { status, message } = e
    res.status(status).send(message)
  }




})



// LISTAR SERIE BILHETES
router.get('/:id_evento/series_bilhetes/listar', async function (req, res, next){

  const { id_evento } = req.params

  // VERIFICAÇÂO
  try{
    // Caso o evento não estita retorna um erro 404 e termina a função
    if(!await eventExists(id_evento)) {
      throw createError(msg.notFound('evento'),404); // Mensagem de erro Página não encontrada
    }

    // Lista
    const series = await queryDB('SELECT id, designacao, numero_bilhetes, limite_vendas, custo FROM serie_bilhetes WHERE evento = ?', [id_evento])
    res.status(200).json(series) // Mensagem de Sucesso
  }catch(e){
    const { status, message } = e
    res.status(status).send(message)
  }

})





// - - - - - - - - - -
// ARTISTAS
// - - - - - - - - - -

// CRIAR ARTISTAS
router.post('/:id_evento/artistas/criar', async function (req, res, next){
  const { nome, estilo, biografia } = req.body
  const { id_evento } = req.params


  try{

    // VERIFICAÇÂO
    // Caso o evento não exista retorna um erro 404 e termina a função
    if(!await eventExists(id_evento)) {
      throw createError(msg.notFound('evento'),404); // Mensagem de erro página não encontrada

    }

    // Caso o artista já exista retorna um erro 404 e termina a função
    const [artista] = await queryDB(`SELECT * FROM artista WHERE nome = ? AND evento = ?`,[nome, id_evento])
    if(artista) {
      throw createError(msg.conflict('artista'),409); // Mensagem de erro Conflito
    }

    // Caso o artista não exista cria o artista
    const creation = await queryDB(`INSERT INTO artista SET nome = ?, estilo = ?, biografia = ?, evento = ?`,
      [nome, estilo, biografia, id_evento])

    // Verifica se pelo menos uma linha foi criada
    if(creation.affectedRows === 0) {
      throw createError(msg.createErr('artista'),500)// Mensagem de Erro Interno
    }
    const [createdArtist] = await queryDB('SELECT id, nome, estilo, biografia FROM artista WHERE id = ?',[creation.insertId])

    res.status(201).send(createdArtist) // Mensagem de Sucesso

  }catch(e){
    const { status, message } = e
    res.status(status).send(message)
  }
})



// EDITAR ARTISTA
router.post('/:id_evento/artista/:id_artista/editar', async function (req, res, next){
  const { nome, estilo, biografia } = req.body
  const { id_evento, id_artista } = req.params


  try{
    // Caso o artista não exista retorna um erro 404 e termina a função
    const artistaExist = await existsElementEvent("artista",id_artista,id_evento)
    if(!artistaExist) {
      throw createError(msg.notFound('artista'),404); // Mensagem de erro página não encontrada
    }

    /// Caso o artista exista faz update
    const update = await queryDB(`UPDATE artista SET nome = ?, estilo = ?, biografia = ? WHERE id = ?`,
      [nome,estilo,biografia, id_artista])
    if (update.affectedRows === 0) {
      throw createError(msg.updateErr('artista'),500); // Mensagem de erro interno
    }

    const [updatedArtist] = await queryDB('SELECT id, nome, estilo, biografia FROM artista WHERE id = ?',[id_artista])

    res.status(200).send(updatedArtist); // Mensagem de sucesso

  }catch(e){
    const { status, message } = e
    res.status(status).send(message)
  }
})




// LISTAR ARTISTA
router.get('/:id_evento/artistas/listar', async function (req, res, next){
  const { id_evento } = req.params


  try{

    // Caso o evento não exista retorna um erro 404 e termina a função
    if(!await eventExists(id_evento)) {
      throw createError(msg.notFound('evento'),404); // Mensagem de erro página não encontrada

    }

    // Lista
    const artistas = await queryDB('SELECT id, nome, estilo, biografia FROM artista WHERE evento = ?', [id_evento])
    res.status(200).json(artistas) // ok

  }catch(e){
    const { status, message } = e
    res.status(status).send(message)
  }

})



// - - - - - - - - - -
// CONCERTOS
// - - - - - - - - - -

// CRIAR CONCERTOS
router.post('/:id_evento/concertos/criar', async function (req, res, next){
  const { artista, palco, data_hora_inicio, data_hora_fim } = req.body
  const { id_evento } = req.params

  // VERIFICAÇÂO

  try{

    // Caso o evento não exista retorna um erro 404 e termina a função
    if(!await eventExists(id_evento)) {
      throw createError(msg.notFound('evento'),404); // Mensagem de erro página não encontrada
    }

    // Caso o palco não exista retorna um erro 404 e termina a função
    const palcoExists = await existsElementEvent("palco",palco,id_evento)
    if(!palcoExists) {
      throw createError(msg.notFound('palco'),404); // Mensagem de erro página não encontrada
    }

    // Caso o artista não exista retorna um erro 404 e termina a função
    const artistaExists = await existsElementEvent("artista",artista,id_evento)
    if(!artistaExists) {
      throw createError(msg.notFound('artista'),404); // Mensagem de erro página não encontrada
    }

    // Caso o concerto já exista retorna um erro 409 e termina a função
    const [concerto] = await queryDB(`SELECT * FROM concerto 
                                        WHERE artista = ? AND evento = ?`, [artista, id_evento])
    if(concerto) {
      throw createError(msg.conflict('concerto'),409) // Mensagem de Erro Conflito
    }

    // Caso a data de fim seja inferior à de começo retorna um erro 400 e termina a função
    if(new Date(data_hora_fim) < new Date(data_hora_inicio)) {
      throw createError("Data/hora de início não pode ser maior que a de fim!",400) // Mensagem Bad Request
    }


    // CRIAR CONCERTO
    const creation = await queryDB(`INSERT INTO concerto SET artista = ?, palco = ?, data_hora_inicio = ?, data_hora_fim = ?, evento = ?`,
      [artista, palco, data_hora_inicio, data_hora_fim, id_evento])

    // Verifica se pelo menos uma linha foi criada
    if(creation.affectedRows === 0) {
      throw createError(msg.createErr('concerto'),500) // Mensagem de erro Interno
    }
    const [created] = await queryDB('SELECT c.id, a.nome, c.data_hora_inicio, c.data_hora_fim FROM concerto c JOIN artista a ON c.artista = a.id WHERE c.id = ?', [creation.insertId])

    res.status(201).send(created) // Mensagemde Sucesso Criado

  }catch(e){
    const { status, message } = e
    res.status(status).send(message)
  }


})





// EDITAR CONCERTO
router.post('/:id_evento/concertos/:id_concerto/editar', async function (req, res, next){
  const { artista, palco, data_hora_inicio, data_hora_fim } = req.body
  const { id_evento, id_concerto } = req.params

  // VERIFICAÇÂO
  try{

    // Caso o concerto não exista retorna um erro 404 e termina a função
    const concerto = await existsElementEvent("concerto",id_concerto,id_evento)
    if(!concerto) {
      throw createError(msg.notFound('concerto'),404); // Mensagem de erro página não encontrada
    }

    // Caso o palco não exista retorna um erro 404 e termina a função
    const palcoExists = await existsElementEvent("palco",palco,id_evento)
    if(!palcoExists) {
      throw createError(msg.notFound('palco'),404); // Mensagem de erro página não encontrada
    }

    // Caso o artista não exista retorna um erro 404 e termina a função
    const artistaExists = await existsElementEvent("artista",artista,id_evento)
    if(!artistaExists) {
      throw createError(msg.notFound('artista'),404); // Mensagem de erro página não encontrada
    }


    // Caso a data de fim seja inferior à de começo retorna um erro 400 e termina a função
    if(new Date(data_hora_fim) < new Date(data_hora_inicio)) {
      throw createError("Data/hora de início não pode ser maior que a de fim!", 400) // Mensagem de erro
    }


    // Edita Concerto
    const update = await queryDB(`UPDATE concerto SET artista = ?, palco = ?, data_hora_inicio = ?, data_hora_fim = ? WHERE id = ?`,
      [artista,palco,data_hora_inicio,data_hora_fim, id_concerto])
    if (update.affectedRows === 0) {
      throw createError(msg.updateErr('concerto'),500) // Mensagem de erro Interno
    }

    const [updated] = await queryDB('SELECT c.id, a.nome, c.data_hora_inicio, c.data_hora_fim FROM concerto c JOIN artista a ON c.artista = a.id WHERE c.id = ?', [id_concerto])

    res.status(200).send(updated); // Mensagem de sucesso

  }catch(e){
    const { status, message } = e
    res.status(status).send(message)
  }
})




// Lista Concertos
router.get('/:id_evento/concertos/listar', async function (req, res, next){
  const { id_evento } = req.params

  // VERIFICAÇÂO

  try{

    // Caso o evento não exista retorna um erro 404 e termina a função
    if(!await eventExists(id_evento)) {
      throw createError(msg.notFound('evento'),404); // Mensagem de erro página não encontrada
    }

    // Lista
    const series = await queryDB(`SELECT c.id, a.nome, c.data_hora_inicio, c.data_hora_fim 
                                      FROM concerto c
                                      JOIN artista a ON c.artista = a.id
                                      WHERE c.evento = ? ORDER BY c.data_hora_inicio;`, [id_evento])
    res.status(200).json(series) // Mensagemde sucesso

  }catch(e){
    const { status, message } = e
    res.status(status).send(message)
  }

})

module.exports = router;