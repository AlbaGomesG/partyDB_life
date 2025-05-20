const pool = require("../config/database");

const getStyles = async (name) => {
    if (!name) {
        const result = await pool.query("SELECT * FROM styles");
        return result.rows;
    } else {
        const result = await pool.query("SELECT * FROM styles WHERE styles.name ILIKE $1", [`%${name}%`]);
        return result.rows;
    }
};

const getStyleById = async (id) => {
    const result = await pool.query("SELECT * FROM styles WHERE id = $1", [id]);
    return result.rows[0];
};

const createStyle = async (style_photo, name, description) => {
    const result = await pool.query(
        "INSERT INTO styles (style_photo, name, description) VALUES ($1, $2, $3) RETURNING *", [style_photo, name, description]);
    return result.rows[0];
};

const updateStyle = async (id, name, description) => {
    const result = await pool.query("UPDATE styles SET name = $1, description = $2 WHERE id = $3 RETURNING *", [name, description, id]);
    return result.rows[0];
};

const deleteStyle = async (id) => {
    const result  = (await pool.query("DELETE FROM styles WHERE id = $1 RETURNING *", [id]));
    if (result.rowCount === 0) {
        return {error: "Estilo não foi encontrado!"};
    }
    return { message: "Estilo deletado com sucesso!" };
};

module.exports = { getStyles, getStyleById, createStyle, updateStyle, deleteStyle };