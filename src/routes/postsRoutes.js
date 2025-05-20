const express = require("express");
const router = express.Router();
const postsController = require("../controllers/postsController");

router.get("/", postsController.getAllPosts);
router.get("/:id", postsController.getPost);
router.post("/", postsController.createPost);
router.put("/:id", postsController.updatePost);
router.delete("/:id", postsController.deletePost);

module.exports = router;