const express = require("express");
const router = express.Router();
const stylesController = require("../controllers/stylesController");

router.get("/", stylesController.getAllStyles);
router.get("/:id", stylesController.getStyle);

module.exports = router;