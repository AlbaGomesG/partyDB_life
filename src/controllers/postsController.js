const postsModel = require("../models/postsModel");

const getAllPosts = async (req, res) => {
    try {
        const { name } = req.query;
        const posts = await postsModel.getPosts(name);
        res.status(200).json(posts);
    } catch (error) {

        res.status(500).json({ error: "Erro ao buscar posts!" });
    }
};

const getPost = async (req, res) => {
    try {
        const userId = req.user.id;
        const post = await postsModel.getPostsById(userId);

        if (post.length === 0) {
            return res.status(404).json({ message: "Nenhum post encontrado!" });
        }
        res.status(200).json(post);
    } catch (error) {
        console.error("Erro ao buscar o post:", error);
        res.status(500).json({ message: "Erro ao buscar o post!" });
    }
};


const createPost = async (req, res) => {
    try {
        const { user_id, event_id, content, local ,data_postagem, horario } = req.body;
        const image_post = req.file ? req.file.filename : null;
        const newPost = await postsModel.createPost(
            user_id, event_id, image_post, content, local, data_postagem, horario
        );
        res.status(201).json({ message: "Post criado com sucesso!", newPost });
    } catch (error) {
        console.error("Erro ao criar o post:", error);
        res.status(500).json({ message: "Erro ao criar o post!" });
    }
};

const updatePost = async (req, res) => {
    try {
        const { user_id, event_id, image_post, content, local, data_postagem, horario } = req.body;
        const updatePost = await postsModel.updatePost(
            req.params.id, user_id, event_id, image_post, content, local ,data_postagem, horario
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