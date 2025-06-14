var database = require("../database/config");

function buscarCorredoresPorEmpresa(empresaId, enderecoId) {
  console.log(empresaId, enderecoId)

  var instrucaoSql = `SELECT * FROM corredor WHERE fkEmpresa = ${empresaId} and fkEndereco = ${enderecoId} `;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}

function cadastrar(empresaId, descricao) {
  
  var instrucaoSql = `INSERT INTO (descricao, fk_empresa) aquario VALUES (${descricao}, ${empresaId})`;

  console.log("Executando a instrução SQL: \n" + instrucaoSql);
  return database.executar(instrucaoSql);
}


module.exports = {
  buscarCorredoresPorEmpresa,
  cadastrar
}
