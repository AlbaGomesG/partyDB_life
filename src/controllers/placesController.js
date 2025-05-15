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

const getPlace = async (req, res) => {
    try{
        const place = await placesModel.getPlaceById(req.params.id);
        if (!place) {
            return res.status(404).json({ message: "Lugar não foi encontrado, tente novamente!"});
        }
        res.json(place);
    } catch (error) {
        res.status(500).json({ message: "Errro ao buscar lugar!"});
    }
};

module.exports = { getAllPlaces, getPlace }