const userModel = require("../models/usersModel");
const pool = require("../config/database");

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
        const userId = req.user.id;
        const user = await userModel.getUserById(userId);
        if (!user) {
            return res.status(404).json({ message: "Usuário não foi encontrado!"});
        }
        res.json(user);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar usuário!"});
    }
};

const createUser = async (req, res) => {
    const{ name, username, email, senha} = req.body;
    const perfil_photo = req.file ? req.file.filename : null;

    try {
      const check = await pool.query('SELECT * FROM users WHERE email = $1', [email]);
    if (check.rows.length > 0) {
        return res.status(400).json({ message: 'Email já cadastrado' });
    }


    const newUser = await userModel.createUser(name, perfil_photo, username, email, senha);
    res.status(201).json(newUser);
    } catch (error) {
        console.error('Erro ao registrar usuário:', error);
        res.status(500).json({ message: 'Erro interno no servidor' });
    }
};


const updateUser = async (req, res) => {
    try {
        const { name, username} = req.body;
        const updateUser = await userModel.updateUser(req.params.id, name, username);
        if (!updateUser) {
            return res.status(404).json({ message: "Usuário não foi encontrado!"});
        }
        res.json({ message: "Usuário atualizado com sucesso!", updateUser});
    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar usuário!"});
    }
};

const deleteUser = async (req, res) => {
    try {
        const message = await userModel.deleteUser(req.params.id);
        res.json(message);
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar usuário!"});
    }
};

module.exports = {getAllUsers, getUser, createUser, updateUser, updateUser, deleteUser};