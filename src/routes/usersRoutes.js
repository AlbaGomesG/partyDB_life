const express = require("express");
const router = express.Router();
const userController = require("../controllers/usersController");
const upload = require('../config/upload');

const { verifyToken } = require("../config/auth");

router.get("/", userController.getAllUsers);
router.get("/:id", verifyToken, userController.getUser);
router.post('/', upload.single('photo'), userController.createUser);
router.put("/:id", userController.updateUser);
router.delete("/:id", userController.deleteUser);

module.exports = router;