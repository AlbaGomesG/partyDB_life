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

const createStyle = async (req, res) => {
    try {
        const { name, description } = req.body;
        const style_photo = req.file ? req.file.filename : null;
        const newStyle = await stylesModel.createStyle(style_photo, name, description);
        res.status(201).json({ message: "Estilo criado com sucesso!", style: newStyle });
    } catch (error) {
        res.status(500).json({ message: "Erro ao criar estilo!"});
    }
};

const updateStyle = async (req, res) => {
    try {
        const { name, description } = req.body;
        const updateStyle = await stylesModel.updateStyle(req.params.id, name, description);
        if (!updateStyle) {
            return res.status(404).json({ message: "Estilo não foi encontrado!"});
        }
        res.json({ message: "Estilo atualizado com sucesso!", style: updateStyle });
    } catch (error) {
        res.status(500).json({ message: "Erro ao atualizar estilo!"});
    }
};

const deleteStyle = async (req, res) => {
    try {
        const message = await stylesModel.deleteStyle(req.params.id);
        res.json(message);
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar estilo!"});
    }
};

module.exports = { getAllStyles, getStyle, createStyle, updateStyle, deleteStyle };