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
        const { title, local, time_start, time_end, description, event_photo, events_rules, party_itens, take_products, attractions, attractions_name, styles, styles_name, hashtags } = req.body;
        const newEvent = await eventsModel.createEvent(
            title, local, time_start, time_end, description, event_photo, events_rules, party_itens, take_products, attractions, attractions_name, styles, styles_name, hashtags
        );
        res.status(201).json({ message: "Evento criado com sucesso!", newEvent });
    } catch (error) {
        console.error(error)
        res.status(500).json({ message: "Erro ao criar o evento!" });
    }
};

const updateEvent = async (req, res) => {
    try {
        if (!req.body || Object.keys(req.body).length === 0) {
            return res.status(400).json({ message: "Corpo da requisição vazio ou inválido!" });
        }
        const { title, local, time_start, time_end, description, event_photo, events_rules, party_itens, take_products, attractions, attractions_name, styles, styles_name, hashtags } = req.body;
        const updateEvent = await eventsModel.updateEvent(
            req.params.id, title, local, time_start, time_end, description, event_photo, events_rules, party_itens, take_products, attractions, attractions_name, styles, styles_name, hashtags
        );
        if (!updateEvent) {
            return res.status(404).json({ message: "Evento não foi encontrado!" });
        }
        res.json({ message: "Evento atualizado com sucesso!", updateEvent });
    } catch (error) {
        console.error("Erro ao atualizar evento:", error); 
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