const express = require("express");
const router = express.Router();
const attractionsController = require("../controllers/attractionsController");

router.get("/", attractionsController.getAllAttractions);
router.get("/:id", attractionsController.getAttraction);

module.exports = router;