const userModel = require("../models/usersModel");

const getAllUsers = async (req, res) => {
    try {
        const { name } = req.query;
        const users = await userModel.getUsers(name);
        res.json(users);
    } catch (error) {
        res.status(404).json({ message: "Erro ao buscar usuários!"});
    }
};

const getUser = async (req, res) => {
    try {
        const user = await userModel.getUserById(req.params.id);
        if (!user) {
            return res.status(404).json({ message: "Usuário não foi encontrado!"});
        }
        res.json(user);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar usuário!"});
    }
};

const createUser = async (req, res) => {
    try{
        const{ name, username, email, bio } = req.body;
        const perfil_photo = req.file ? req.file.filename : null;
        const newUser = await userModel.createUser(name, username, email, perfil_photo, bio);
        res.status(201).json({ message: "Usuário criado com sucesso!", newUser});
    } catch (error) {
        if (error.code === "23505") {
            return res.status(400).json({ message: "Usuário já está cadastrado!"});
        }
        res.status(500).json({ message: "Erro ao criar usuário!"});
    }
};

const updateUser = async (req, res) => {
    try {
        const { name, username, bio } = req.body;
        const updateUser = await userModel.updateUser(req.params.id, name, username, bio);
        if (!updateUser) {
            return res.status(404).json({ message: "Usuário não foi encontrado!"});
        }
        res.json({ message: "Usuário atualizado com sucesso!", updateUser});
    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar usuário!"});
    }
};

module.exports = {getAllUsers, getUser, createUser, updateUser, updateUser};