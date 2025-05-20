const postsModel = require("../models/postsModel");

const getAllPosts = async (req, res) => {
    try {
        const { name } = req.query;
        const posts = await postsModel.getPosts(name);
        res.status(200).json(posts);
    } catch (error) {
        console.error("Erro ao buscar posts:", error); 
        res.status(500).json({ error: "Erro ao buscar posts!" });
    }
};

const getPost = async (req, res) => {
    try {
        const post = await postsModel.getPostById(req.params.id);
        if (!post) {
            return res.status(404).json({ message: "Post não encontrado!" });
        }
        res.json(post);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar o post!" });
    }
};

const createPost = async (req, res) => {
    try {
        const { user_id, event_id, image_post, content, data_postagem } = req.body;
        const newPost = await postsModel.createPost(
            user_id, event_id, image_post, content, data_postagem
        );
        res.status(201).json({ message: "Post criado com sucesso!", newPost });
    } catch (error) {
        res.status(500).json({ message: "Erro ao criar o post!" });
    }
};

const updatePost = async (req, res) => {
    try {
        const { user_id, event_id, image_post, content, data_postagem } = req.body;
        const updatePost = await postsModel.updatePost(
            req.params.id, user_id, event_id, image_post, content, data_postagem
        );
        if (!updatePost) {
            return res.status(404).json({ message: "Post não foi encontrado!" });
        }
        res.json({ message: "Post atualizado com sucesso!", updatePost });
    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar o post!" });
    }
};  

const deletePost = async (req, res) => {
    try {
        const message = await postsModel.deletePost(req.params.id);
        res.json(message);
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar o post!" });
    }
};

module.exports = { getAllPosts, getPost, createPost, updatePost, deletePost };