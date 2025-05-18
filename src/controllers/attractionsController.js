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

module.exports = { getAllAttractions, getAttraction };