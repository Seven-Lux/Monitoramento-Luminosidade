var express = require("express");
var router = express.Router();

var corredorController = require("../controllers/corredorController");

router.get("/:empresaId", function (req, res) {
  corredorController.buscarCorredoresPorEmpresa(req, res);
});

router.post("/cadastrar", function (req, res) {
  corredorController.cadastrar(req, res);
})

module.exports = router;