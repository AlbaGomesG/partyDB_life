const eventsModel = require("../models/eventsModel");

const getAllEvents = async (req, res) => {
    try {
        const { name } = req.query;
        const events = await eventsModel.getEvents(name);
        res.status(200).json(events);
    } catch (error) {
        console.error("Erro ao buscar eventos:", error); 
        res.status(500).json({ error: "Erro ao buscar eventos!" });
    }
};

const getEvent = async (req, res) => {
    try {
        const event = await eventsModel.getEventById(req.params.id);
        if (!event) {
            return res.status(404).json({ message: "Evento não encontrado!" });
        }
        res.json(event);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar o evento!" });
    }
};

const createEvent = async (req, res) => {
    try {
        const { title, place_id, attraction_id, style_id, time_start, time_end, description, event_photo } = req.body;
        const newEvent = await eventsModel.createEvent(
            title, place_id, attraction_id, style_id, time_start, time_end, description, event_photo
        );
        res.status(201).json({ message: "Evento criado com sucesso!", newEvent });
    } catch (error) {
        res.status(500).json({ message: "Erro ao criar o evento!" });
    }
};

const updateEvent = async (req, res) => {
    try {
        const { title, place_id, attraction_id, style_id, time_start, time_end, description, event_photo } = req.body;
        const updateEvent = await eventsModel.updateEvent(
            req.params.id, title, place_id, attraction_id, style_id, time_start, time_end, description, event_photo
        );
        if (!updateEvent) {
            return res.status(404).json({ message: "Evento não foi encontrado!" });
        }
        res.json({ message: "Evento atualizado com sucesso!", updateEvent });
    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar o evento!" });
    }
};  

const deleteEvent = async (req, res) => {
    try {
        const message = await eventsModel.deleteEvent(req.params.id);
        res.json(message);
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar o evento!" });
    }
};

module.exports = { getAllEvents, getEvent, createEvent, updateEvent, deleteEvent };