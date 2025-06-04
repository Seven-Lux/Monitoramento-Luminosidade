var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/dias/:idCorredor", function (req, res) {
    medidaController.buscarUltimasMedidasDia(req, res);
});

router.get("/horas/:idCorredor", function (req, res) {
    medidaController.buscarUltimasMedidasHoras(req, res);
});


router.get("/tempo-real/:idCorredor", function (req, res) {
    medidaController.buscarMedidasEmTempoReal(req, res);
})

module.exports = router;