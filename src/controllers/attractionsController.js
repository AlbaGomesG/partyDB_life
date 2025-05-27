const attractionsModel = require("../models/attractionsModel");

const getAllAttractions=  async (req, res) => {
    try {
        const { name } = req.query;
        const attractions = await attractionsModel.getAttractions(name);
        res.json(attractions);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar atrações!"});
    }
};

const getAttraction = async (req, res) => {
    try {
        const attraction = await attractionsModel.getAttractionById(req.params.id);
        if (!attraction) {
            return res.status(404).json({ message: "Atração não foi encontrada!"});
        }
        res.json(attraction);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar a atração!"});
    }
};

const createAttraction = async (req, res) => {
    try {
        const { name, description } = req.body;

        if (!name || !description) {
            return res.status(400).json({ message: "Nome e descrição são obrigatórios!" });
        }

        const attractions_photo = req.file ? req.file.filename : null;
        const newAttraction = await attractionsModel.createAttraction(attractions_photo, name, description);
        res.status(201).json({ message: "Atração criada com sucesso!", newAttraction });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Erro ao criar a atração!", error: error.message });
    }
};

const updateAttraction = async (req, res) => {
    try {
        const { attractions_photo, name, description } = req.body;
        const updateAttraction = await attractionsModel.updateAttraction(req.params.id, attractions_photo, name, description);
        if (!updateAttraction) {
        return res.status(404).json({ message: "Atração não foi encontrada!"});
        }
        res.json({ message: "Atração atualizada com sucesso!", updateAttraction});
    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar a atração!"});
    }
};

const deleteAttraction = async (req, res) => {
    try {
        const message = await attractionsModel.deleteAttraction(req.params.id);
        res.json(message);
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar a atração!"});
    }
};

module.exports = { getAllAttractions, getAttraction, createAttraction, updateAttraction, deleteAttraction };