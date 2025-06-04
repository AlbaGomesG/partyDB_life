const express = require("express");
const router = express.Router();
const userController = require("../controllers/usersController");
const { verifyToken } = require("../config/auth");

router.get("/", userController.getAllUsers);
router.get("/:id", verifyToken, userController.getUser);
router.post("/", userController.createUser);
router.put("/:id", userController.updateUser);
router.delete("/:id", userController.deleteUser);

module.exports = router;