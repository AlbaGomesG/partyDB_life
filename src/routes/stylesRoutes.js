const express = require("express");
const router = express.Router();
const stylesController = require("../controllers/stylesController");
const upload = require("../config/upload");

router.get("/", stylesController.getAllStyles);
router.get("/:id", stylesController.getStyle);
router.post("/", upload.single("style_photo"), stylesController.createStyle);
router.put("/:id", stylesController.updateStyle);
router.delete("/:id", stylesController.deleteStyle);

module.exports = router;