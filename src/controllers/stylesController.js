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

module.exports = { getAllStyles };