const express = require("express");
const router = express.Router();
const stylesController = require("../controllers/stylesController");

router.get("/", stylesController.getAllStyles);

module.exports = router;