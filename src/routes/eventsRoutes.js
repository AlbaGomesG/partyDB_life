const express = require("express");
const router = express.Router();
const eventsController = require("../controllers/eventsController");
const upload = require("../config/upload");

router.get("/", eventsController.getAllEvents);
router.get("/:id", eventsController.getEvent);
router.post("/", upload.fields([
    {name: "photo", maxCount: 1},
    {name: "attractions", maxCount: 1},
    {name: "styles", maxCount: 1},
]), eventsController.createEvent);
router.put("/:id", eventsController.updateEvent);
router.delete("/:id", eventsController.deleteEvent);

module.exports = router;