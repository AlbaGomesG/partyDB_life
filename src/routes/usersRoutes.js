const express = require("express");
const router = express.Router();
const userController = require("../controllers/usersController");
const upload = require("../config/upload");

router.get("/", userController.getAllUsers);
router.get("/:id", userController.getUser);
router.post("/", upload.single("perfil_photo"), userController.createUser);

module.exports = router;