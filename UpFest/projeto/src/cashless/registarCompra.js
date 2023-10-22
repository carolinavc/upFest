const { queryDB } = require("../connection");
const { createError, existeEvento, existeProduto, existeParticipante } = require('../util/utilFunctions')
const express = require("express");
const router = express.Router();

router.post('/:id_evento/registar_compra', (async (req, res) => {
    try {
        let {id_evento} = req.params
        let {participante, produto, quantidade} = req.body

        if (participante === undefined || produto === undefined || quantidade === undefined) {
            throw createError('Corpo do pedido sem os valores necessários para a criação de um novo registo de compra.',
                400) //erro bad request
        }

        await existeEvento(id_evento);
        let produtoCompra = await existeProduto(parseInt(produto));
        let participanteCliente = await existeParticipante(participante);

        let [comercianteProduto] = await queryDB('SELECT comerciante FROM produto_comerciante WHERE id = ?',
            [produto])
        let idComerciante = comercianteProduto.comerciante

        let nomeParticipante = participanteCliente.nome
        let produtoDesignacao = produtoCompra.designacao

        let [existeComercianteEvento] = await queryDB('SELECT * FROM comerciante WHERE evento = ? AND id = ?',
            [id_evento, idComerciante])

        if (existeComercianteEvento === undefined) {
            throw createError(`Produto com ID ${produto} não está à venda no evento com ID ${id_evento}.`,
                400) // erro bad request
        }

        let idParticipante = participanteCliente.id

        let [contaParticipante] = await queryDB('SELECT * FROM conta_cashless WHERE participante = ? AND evento = ?',
            [idParticipante, id_evento])

        if (contaParticipante === undefined) {
            throw createError(`O participante com email ${participante} não tem conta cashless no evento com ID ${id_evento}`,404)
        }

        let saldoAtual = contaParticipante.valor_atual
        let totalCompra = produtoCompra.valor * quantidade

        if (saldoAtual < totalCompra) {
            throw createError
            (`O participante ${nomeParticipante} não tem saldo suficiente na sua conta cashless para efetuar esta compra. O seu saldo atual é de ${saldoAtual}, a compra iguala um total de ${totalCompra}`,
                400)
        }

        let novoSaldo = saldoAtual - totalCompra

        let criarMovimento = await queryDB('INSERT INTO movimento_cashless (tipo, conta, valor, saldo, data) VALUES (?, ?, ?, ?, NOW())',
            ["gasto", contaParticipante.id, totalCompra, novoSaldo])

        let idMovimento = criarMovimento.insertId

        await queryDB('INSERT INTO gasto_cashless (movimento, produto, quantidade, valor_unitario) VALUES (?, ?, ?, ?)',
            [idMovimento, produto, quantidade, produtoCompra.valor])

        await queryDB(`UPDATE conta_cashless
                       SET valor_atual = ?
                       WHERE participante = ?`,
            [novoSaldo, idParticipante])

        res.status(201) // status created
        res.send(`Registo de compra do produto ${produtoDesignacao}, em quantidade ${quantidade}, efetuada pelo participante ${nomeParticipante}, criado com sucesso.`)

    } catch (e) {
        res.status(e.status)
        res.send({message: e.message, status: e.status})
    }
}))

module.exports = router;
