const usersInfoModel = require('../models/usersInfoModel');


const getUsersInfo = async (req, res) => {
    try {
        const usersInfo = await usersInfoModel.getAllUsersInfo();
        res.json(usersInfo);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar informações dos usuários!" });
        console.error("Erro ao buscar informações dos usuários:", error);
    }
};

const getUserInfoById = async (req, res) => {
    try {
        const userId = req.params.id;
        const userInfo = await usersInfoModel.getUserInfoById(userId);
        if (!userInfo) {
            return res.status(404).json({ message: "Informações do usuário não encontradas!" });
        }
        res.json(userInfo);
    } catch (error) {
        console.error("Erro ao buscar informações do usuário:", error);
        res.status(500).json({ message: "Erro ao buscar informações do usuário!" });
    }
};
const updateUserInfo = async (req, res) => {
    try {
        const { name, bio } = req.body;
        const userId = req.params.id;
        const updatedUserInfo = await usersInfoModel.updateUserInfo(userId, name, bio);
        if (!updatedUserInfo) {
            return res.status(404).json({ message: "Informações do usuário não encontradas!" });
        }
        res.json({ message: "Informações do usuário atualizadas com sucesso!", updatedUserInfo });
    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar informações do usuário!" });
    }
};

const deleteUserInfo = async (req, res) => {
    try {
        const userId = req.params.id;
        const result = await usersInfoModel.deleteUserInfo(userId);
        if (result.error) {
            return res.status(404).json(result);
        }
        res.json(result);
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar informações do usuário!" });
    }
};

module.exports = { getUsersInfo, getUserInfoById, updateUserInfo, deleteUserInfo };