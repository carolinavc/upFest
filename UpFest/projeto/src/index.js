require('dotenv').config()
const express = require("express");
const app = express();

app.use(express.urlencoded());
app.use(express.json());

app.use("/evento", require('./evento/evento.js'))
app.use("/vendas", require("./vendas/vendas.js"))
app.use("/cashless", require("./cashless/cashless.js"))

// edit
app.use("/cashless", require("./cashless/produto.js"))
app.use("/cashless", require("./cashless/comerciante.js"))
app.use("/cashless", require("./cashless/registarCompra.js"))

app.listen(3000, function () {
  console.log("Servidor iniciado na porta 3000");
})
