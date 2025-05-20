const integrantesModel = require("../models/integrantesModel");

const getAllIntegrantes = async (req, res) => {
    try {
        const { name } = req.query;
        const integrantes = await integrantesModel.getIntegrantes(name);
        res.json(integrantes);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar integrantes!" });
    }
};
const getIntegrante = async (req, res) => {
    try {
        const integrante = await integrantesModel.getIntegranteById(req.params.id);
        if (!integrante) {
            return res.status(404).json({ message: "Integrante não foi encontrado!" });
        }
        res.json(integrante);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar o integrante!" });
    }
};
const createIntegrante = async (req, res) => {
    try {
        const { name, description } = req.body;
        const integrante_photo = req.file ? req.file.filename : null;
        const newIntegrante = await integrantesModel.createIntegrante(integrante_photo, name, description);
        res.status(201).json({ message: "Integrante criado com sucesso!", newIntegrante });
    } catch (error) {
        res.status(500).json({ message: "Erro ao criar o integrante!" });
    }
};

const updateIntegrante = async (req, res) => {
    try {
        const { name, description } = req.body;
        const updateIntegrante = await integrantesModel.updateIntegrante(req.params.id, name, description);
        if (!updateIntegrante) {
            return res.status(404).json({ message: "Integrante não foi encontrado!" });
        }
        res.json({ message: "Integrante atualizado com sucesso!", updateIntegrante });
    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar o integrante!" });
    }
};

const deleteIntegrante = async (req, res) => {
    try {
        const message = await integrantesModel.deleteIntegrante(req.params.id);
        res.json(message);
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar o integrante!" });
    }
};

module.exports = { getAllIntegrantes, getIntegrante, createIntegrante, updateIntegrante, deleteIntegrante };