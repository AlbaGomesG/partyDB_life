const stylesModel = require("../models/stylesModel");

const getAllStyles = async (req, res) => {
    try {
        const { name } = req.query;
        const styles = await stylesModel.getStyles(name);
        res.json(styles);
    } catch (error) {
        res.status(500).json({ message: "Erro ao buscar estilos!" });
    }
};

const getStyle = async (req, res) => {
    try {
        const style = await stylesModel.getStyleById(req.params.id);
        if (!style) {
            return res.status(404).json({ message: "Estilo não foi encontrado!" });
        }
        res.json(style);
    } catch (error) {
        console.log(error);
        res.status(500).json({ message: "Erro ao buscar estilo!" });
    }
};

const createStyle = async (req, res) => {
    try {
        const { name, description } = req.body;
        const styles_photo = req.file ? req.file.filename : null; // nome correto
        const newStyle = await stylesModel.createStyle(styles_photo, name, description);
        res.status(201).json({ message: "Estilo criado com sucesso!", style: newStyle });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Erro ao criar estilo!", error: error.message });
    }
};

const updateStyle = async (req, res) => {
    try {
        const { name, description } = req.body;
        const styles_photo = req.file ? req.file.filename : null; // permite atualizar a foto
        const updatedStyle = await stylesModel.updateStyle(req.params.id, styles_photo, name, description);
        if (!updatedStyle) {
            return res.status(404).json({ message: "Estilo não foi encontrado!" });
        }
        res.json({ message: "Estilo atualizado com sucesso!", style: updatedStyle });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Erro ao atualizar estilo!", error: error.message });
    }
};

const deleteStyle = async (req, res) => {
    try {
        const deleted = await stylesModel.deleteStyle(req.params.id);
        if (!deleted) {
            return res.status(404).json({ message: "Estilo não foi encontrado!" });
        }
        res.json({ message: "Estilo deletado com sucesso!" });
    } catch (error) {
        res.status(500).json({ message: "Erro ao deletar estilo!", error: error.message });
    }
};

module.exports = {
    getAllStyles,
    getStyle,
    createStyle,
    updateStyle,
    deleteStyle
};