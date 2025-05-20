const express = require("express");
const router = express.Router();
const attractionsController = require("../controllers/attractionsController");
const upload = require("../config/upload");

router.get("/", attractionsController.getAllAttractions);
router.get("/:id", attractionsController.getAttraction);
router.post("/", upload.single("attraction_photo"), attractionsController.createAttraction);
router.put("/:id", attractionsController.updateAttraction);
router.delete("/:id", attractionsController.deleteAttraction);

module.exports = router;