var express = require("express");
var router = express.Router();

var medidaController = require("../controllers/medidaController");

router.get("/dias/:idCorredor", function (req, res) {
    medidaController.buscarUltimasMedidasDia(req, res);
});

router.get("/horas/:idCorredor", function (req, res) {
    medidaController.buscarUltimasMedidasHoras(req, res);
});


router.get("/tempo-real-dia/:idCorredor", function (req, res) {
    medidaController.buscarMedidasEmTempoRealDia(req, res);
})

router.get("/tempo-real-hora/:idCorredor", function (req, res) {
    medidaController.buscarMedidasEmTempoRealHora(req, res);
})

module.exports = router;