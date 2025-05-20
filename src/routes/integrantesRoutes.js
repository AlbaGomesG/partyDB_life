const express = require("express");
const router = express.Router();
const integrantesController = require("../controllers/integrantesController");
const upload = require("../config/upload");

router.get("/", integrantesController.getAllIntegrantes);
router.get("/:id", integrantesController.getIntegrante);
router.post("/", upload.single("integrante_photo"), integrantesController.createIntegrante);
router.put("/:id", integrantesController.updateIntegrante);
router.delete("/:id", integrantesController.deleteIntegrante);

module.exports = router;