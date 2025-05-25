const express = require("express");
const router = express.Router();
const postsController = require("../controllers/postsController");
const upload = require("../config/upload");
const { verifyToken } = require("../config/auth");

router.get("/", postsController.getAllPosts);
router.get("/:id", verifyToken, postsController.getPost);
router.post("/", upload.single("image_post"), postsController.createPost);
router.put("/:id", postsController.updatePost);
router.delete("/:id", postsController.deletePost);

module.exports = router; 