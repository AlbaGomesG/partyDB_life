const express = require("express");
const router = express.Router();
const placesController = require("../controllers/placesController");

router.get("/", placesController.getAllPlaces);
router.get("/:id", placesController.getPlace);
router.post("/", placesController.createPlace);

module.exports = router;