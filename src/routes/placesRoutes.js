const express = require("express");
const router = express.Router();
const placesController = require("../controllers/placesController");

router.get("/", placesController.getAllPlaces);
router.get("/:id", placesController.getPlace);
router.post("/", placesController.createPlace);
router.put("/:id", placesController.updatePlace);
router.delete("/:id", placesController.deletePlace);

module.exports = router;