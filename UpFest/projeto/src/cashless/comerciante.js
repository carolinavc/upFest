const { queryDB } = require("../connection");
const { createError, existeEvento, existeComerciante } = require('../util/utilFunctions')
const express = require("express");
const router = express.Router();

// ENDPOINT CRIAR COMERCIANTE
router.post('/:id_evento/comerciantes/criar', (async (req, res) => {
    try {
        let {id_evento} = req.params       // ID Evento tem que ser válido
        let{designacao} = req.body

        if(designacao === undefined) {
            throw createError('Corpo do pedido sem os valores necessários para a criação de um novo comerciante.',
                400) //erro bad request
        }

        await existeEvento(id_evento)
        const criaComerciante = await queryDB('INSERT INTO comerciante (evento, designacao) VALUES (?, ?)', [id_evento, designacao])
        const [comercianteCriado] = await queryDB('SELECT id, designacao FROM comerciante WHERE id = ?', [criaComerciante.insertId])

        res.status(201) //status created
        res.send({mensagem:`Comerciante ${designacao}, do evento com ID ${id_evento} criado com sucesso`, comerciante: comercianteCriado})
        // await queryDB('SELECT designacao FROM comerciante'))

    } catch(e) {
        res.status(e.status)
        res.send({message: e.message, status: e.status})
    }
}))

// ENDPOINT EDITAR COMERCIANTE
router.post('/:id_evento/comerciantes/:id_comerciante/editar', (async (req, res) => {
    try {
        let {id_evento, id_comerciante} = req.params // IDs têm que ser válidos
        let{designacao} = req.body

        if(designacao === undefined) {
            throw createError('Corpo do pedido sem os valores necessários para a alteração dos dados do comerciante.',
                400) //erro bad request
        }

        await existeEvento(id_evento)
        let comerciante = await existeComerciante(id_comerciante)

        if(comerciante.evento !== parseInt(id_evento)) {
            throw createError(`Comerciante com ID ${id_comerciante} não está associado ao evento com ID ${id_evento}. Não é possível a alteração dos seus dados.`,
                400) // erro bad request
        }

        await queryDB(
            `UPDATE comerciante 
                SET designacao = ?
                WHERE id = ?`, [designacao, id_comerciante])

        res.status(200) // status OK
        res.send(`Comerciante ${designacao}, com ID ${id_comerciante}, alterado com sucesso`)
        // await queryDB('SELECT designacao, valor FROM produto_comerciante'))

    } catch(e) {
        res.status(e.status)
        res.send({message: e.message, status: e.status})
    }
}))

// ENDPOINT LISTAR COMERCIANTES:

router.get('/:id_evento/comerciantes/listar', async function (req, res) {
    try {
        let query = await queryDB
        ('SELECT id, designacao FROM comerciante c WHERE evento = ?',
            [req.params.id_evento])

        res.send(query)

    }catch(e) {
        console.log(e)
    }
})

module.exports = router;