const express = require("express");
const router = express.Router();
const userController = require("../controllers/usersController");
const multer = require('multer');
const upload = multer({ dest: 'uploads/' });

const { verifyToken } = require("../config/auth");

router.get("/", userController.getAllUsers);
router.get("/:id", verifyToken, userController.getUser);
router.post('/', upload.single('perfil_photo'), userController.createUser);
router.put("/:id", userController.updateUser);
router.delete("/:id", userController.deleteUser);

module.exports = router;