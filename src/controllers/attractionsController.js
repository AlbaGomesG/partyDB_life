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

module.exports = { getAllAttractions };