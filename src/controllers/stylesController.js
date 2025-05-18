const stylesModel = require("../models/stylesModel");

const getAllStyles = async (req, res) => {
    try {
        const { name } = req.query;
        const styles = await stylesModel.getStyles(name);
        res.json(styles);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar estilos!"});
    }
};

const getStyle = async (req, res) => {
    try {
        const style = await stylesModel.getStyleById(req.params.id);
        if (!style) {
            return res.status(404).json({ message: "Estilo não foi encontrado!"});
        }
        res.json(style);
    } catch (error) {
        console.log(error);
        res.status(500).json({ message: "Erro ao buscar estilo!"});
    }
};

module.exports = { getAllStyles, getStyle };