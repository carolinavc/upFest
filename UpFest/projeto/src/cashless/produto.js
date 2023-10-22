const { queryDB } = require("../connection");
const { createError, existeEvento, existeComerciante, existeProduto } = require('../util/utilFunctions')
const express = require("express");
const router = express.Router();

// ENDPOINT CRIAR PRODUTO
router.post('/:id_evento/comerciantes/:id_comerciante/produtos/criar', (async (req, res) => {
    try {
        let {id_evento, id_comerciante} = req.params // IDs têm que ser válidos
        let{designacao, valor} = req.body

        if(designacao === undefined || valor === undefined) {
            throw createError('Corpo do pedido sem os valores necessários para a alteração dos dados do comerciante.',
                400) //erro bad request
        }

        let evento = await existeEvento(id_evento)
        let comerciante = await existeComerciante(id_comerciante)

        if(comerciante.evento !== parseInt(id_evento)) {
            console.log(comerciante.evento)
            console.log(id_evento)
            throw createError(`Comerciante com ID ${id_comerciante} não está associado ao evento com ID ${id_evento}`,
                400) // erro bad request
        }

        const criarProduto = await queryDB('INSERT INTO produto_comerciante (comerciante, designacao, valor) VALUES (?, ?, ?)',
            [id_comerciante, designacao, valor])
        const [produtoCriado] = await queryDB('SELECT id, designacao, valor FROM produto_comerciante WHERE id = ?', [criarProduto.insertId])

        res.status(201) // status created
        res.send({ mensagem:`Produto ${designacao}, do comerciante com ID ${id_comerciante}, com o valor ${valor}€, criado com sucesso`, produto: produtoCriado})
        // await queryDB('SELECT designacao, valor FROM produto_comerciante'))

    } catch(e) {
        console.log(e)
        res.status(e.status || 500)
        res.send({message: e.message, status: e.status || 500})
    }
}))

// ENDPOINT EDITAR PRODUTO
router.post('/:id_evento/comerciantes/:id_comerciante/produtos/:id_produto/editar', (async (req, res) => {
    try {
        let {id_evento, id_comerciante, id_produto} = req.params // IDs têm que ser válidos
        let{designacao, valor} = req.body

        if(designacao === undefined && valor === undefined) {
            throw createError('Corpo do pedido sem os valores necessários para a alteração dos dados do comerciante.',
                400) //erro bad request
        }

        let evento = await existeEvento(id_evento)
        let comerciante = await existeComerciante(id_comerciante)
        let produto = await existeProduto(id_produto)

        if(comerciante.evento !== parseInt(id_evento)) {
            throw createError(`Comerciante com ID ${id_comerciante} não está associado ao evento com ID ${id_evento}`,
                400) // erro bad request
        }

        if(produto.comerciante !== parseInt(id_comerciante)) {
            throw createError(`Comerciante com ID ${id_comerciante} não está associado ao produto com ID ${id_produto}`,
                400) // erro bad request
        }

        let designacaoAtual = produto.designacao
        let valorAtual = produto.valor

        await queryDB(
            `UPDATE produto_comerciante 
                SET designacao = ?,
                    valor = ?
                WHERE id = ?`, [designacao || designacaoAtual, valor || valorAtual, id_produto])

        res.status(200) // status OK
        res.send(`Produto ${designacao || designacaoAtual}, com o ID ${id_produto} do comerciante com ID ${id_comerciante}, alterado com sucesso`)

    } catch(e) {
        res.status(e.status || 500)
        res.send({message: e.message, status: e.status || 500})
    }
}))

// ENDPOINT LISTAR PRODUTOS
router.get('/:id_evento/comerciantes/:id_comerciante/produtos/listar', (async (req, res) => {
    try {
        let query = await queryDB
        ('SELECT p.id, p.designacao, p.valor FROM produto_comerciante p INNER JOIN comerciante c ON p.comerciante = c.id WHERE c.id = ? AND evento = ?',
            [req.params.id_comerciante, req.params.id_evento])

        res.send(query)

    }catch(e) {
        console.log(e)
    }
}))

module.exports = router;