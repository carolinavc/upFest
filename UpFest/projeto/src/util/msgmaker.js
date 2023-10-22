class Messagemaker {
  constructor() {
  }

  update(table, feminine) {
    let atualizado = 'atualizado'
    if(feminine) atualizado = 'atualizada'
    return `${this._capitalize(table)} ${atualizado} com sucesso`
  }
  updateErr(table) {
    return `Falha ao atualizar ${table.toLowerCase()}. Tente novamente mais tarde.`
  }
  create(table, feminine) {
    let criado = 'criado'
    if(feminine) criado = 'criada'
    return `${this._capitalize(table)} ${criado} com sucesso`
  }
  createErr(table) {
    return `Falha ao criar ${table.toLowerCase()}. Tente novamente mais tarde.`
  }

  notFound(table) {
    return `${this._capitalize(table)} não encontrado.`
  }

  conflict(table) {
    return `${this._capitalize(table)} já existe`
  }
  _capitalize(word) {
    return word.charAt(0).toUpperCase() + word.slice(1).toLowerCase();
  }
}

module.exports = Messagemaker