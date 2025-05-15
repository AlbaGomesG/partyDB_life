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

module.exports = {getAllUsers}