const express = require("express");
const router = express.Router();
const usersInfoController = require("../controllers/usersInfoController");
const { verifyToken } = require("../config/auth");

router.get("/", usersInfoController.getUsersInfo);
router.get("/:id", verifyToken, usersInfoController.getUsersInfo);
router.put("/:id", verifyToken, usersInfoController.updateUserInfo);
router.delete("/:id", verifyToken, usersInfoController.deleteUserInfo);

module.exports = router;