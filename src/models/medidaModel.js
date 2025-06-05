var database = require("../database/config");

function buscarUltimasMedidasDia(idCorredor, limite_linhas) {

    var instrucaoSql = `SELECT 
                        idSensor
                    FROM sensor
                    where fkCorredor = ${idCorredor}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql)
        .then(
            resposta => {
                console.log(resposta)
                var instrucaoSql2 = `select round(avg(luminancia),2) as mediaLuxDia
                                from dados
                                where fkSensor = ${resposta[0].idSensor}
                                group by day(dtHora)
                                order by day(dtHora) desc limit ${limite_linhas} `
                console.log("Executando a instrução SQL: \n" + instrucaoSql2);
                return database.executar(instrucaoSql2)

            }
        );
}


function buscarUltimasMedidasHoras(idCorredor, limite_linhas) {

    var instrucaoSql = `SELECT 
                        idSensor
                    FROM sensor
                    where fkCorredor = ${idCorredor}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql)
        .then(
            resposta => {
                console.log(resposta)
                var instrucaoSql2 = `select round(avg(luminancia),2) as mediaLuxDia
                                from dados
                                where fkSensor = ${resposta[0].idSensor}
                                group by hour(dtHora)   
                                order by hour(dtHora) desc limit ${limite_linhas} `
                console.log("Executando a instrução SQL: \n" + instrucaoSql2);
                return database.executar(instrucaoSql2)

            }
        );
}

function buscarMedidasEmTempoRealDia(idCorredor) {

    var instrucaoSql = `SELECT 
                        idSensor
                    FROM sensor
                    where fkCorredor = ${idCorredor}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql)
        .then(
            resposta => {
                console.group(resposta)
                var instrucaoSql2 = `select round(avg(luminancia),2) as mediaLuxDia
                                from dados
                                where fkSensor = ${resposta[0].idSensor}
                                group by day(dtHora)
                                order by day(dtHora) desc limit 1 `
                console.log("Executando a instrução SQL: \n" + instrucaoSql2);
                return database.executar(instrucaoSql2)

            }
        );
}

function buscarMedidasEmTempoRealHora(idCorredor) {

    var instrucaoSql = `SELECT 
                        idSensor
                    FROM sensor
                    where fkCorredor = ${idCorredor}`;

    console.log("Executando a instrução SQL: \n" + instrucaoSql);
    return database.executar(instrucaoSql)
        .then(
            resposta => {
                var instrucaoSql2 = `select round(avg(luminancia),2) as mediaLuxDia
                                from dados
                                where fkSensor = ${resposta[0].idSensor}
                                group by hour(dtHora)
                                order by hour(dtHora) desc limit 1 `
                console.log("Executando a instrução SQL: \n" + instrucaoSql2);
                return database.executar(instrucaoSql2)

            }
        );
}
module.exports = {
    buscarUltimasMedidasDia,
    buscarMedidasEmTempoRealDia,
    buscarUltimasMedidasHoras,
    buscarMedidasEmTempoRealHora
}
