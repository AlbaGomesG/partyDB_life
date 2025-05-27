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
        const { name, description, places_photo } = req.body; // Corrigido para places_photo
        const newPlace = await placesModel.createPlace(name, description, places_photo); // Corrigido para places_photo
        res.status(201).json({ message: "Lugar criado com sucesso!", newPlace});
    } catch (error) {
        console.error(error); 
        if (error.code === "23505") {
            return res.status(400).json({ message: "Esse lugar já existe no nosso sistema!"});
        }
        res.status(404).json({ message: "Erro ao criar lugar!", error: error.message });
    }
};

const updatePlace = async (req, res) => {
    try{
        const { description, places_photo } = req.body; // Corrigido para places_photo
        const updatePlace = await placesModel.updatePlace(req.params.id, description, places_photo); // Corrigido para places_photo
        if (!updatePlace) {
            return res.status(404).json({ message: "Lugar não foi encontrado!"});
        }
        res.status(201).json({ message: "Lugar foi atualizado com sucesso!", updatePlace});
    } catch (error) {
        return res.status(500).json({ message: "Erro ao atualizar lugar!"});
    }
};

const deletePlace = async (req, res) => {
    try {
        const message = await placesModel.deletePlace(req.params.id);
        res.json(message);
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar o lugar!"});
    }
};

module.exports = { getAllPlaces, getPlace, createPlace ,updatePlace, deletePlace }