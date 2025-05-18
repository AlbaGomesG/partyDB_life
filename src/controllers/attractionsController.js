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
        const attraction_photo = req.file ? req.file.filename : null;
        const newAttraction = await attractionsModel.createAttraction(attraction_photo, name, description);
        res.status(201).json({ message: "Atração criada com sucesso!", newAttraction});
    } catch (error) {
        res.status(500).json({ message: "Erro ao criar a atração!"});
    }
};

module.exports = { getAllAttractions, getAttraction, createAttraction };