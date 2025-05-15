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

const createPlace = async (req, res) => {
    try{
        const { name, description, place_photo } = req.body;
        const newPlace = await placesModel.createPlace(name, description, place_photo);
        res.status(201).json({ message: "Lugar criado com sucesso!", newPlace});
    } catch (error) {
        if (error.code === "23505") {
            return res.status(400).json({ message: "Esse lugar já existe no nosso sistema!"});
        }
        res.status(404).json({ message: "Erro ao criar lugar!"});
    }
};

module.exports = { getAllPlaces, getPlace, createPlace }