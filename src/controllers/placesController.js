const pool = require("../config/database");
const placesModel = require("../models/placesModel");

const getAllPlaces = async (req, res) => {
    try {
        const places = await placesModel.getPlaces();
        res.json(places);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar lugares!"});
    }
};

module.exports = { getAllPlaces }