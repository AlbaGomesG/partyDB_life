const pool = require("../config/database");

const getStyles = async (name) => {
    if (!name) {
        const result = await pool.query("SELECT * FROM styles");
        return result.rows;
    } else {
        const result = await pool.query("SELECT * FROM styles WHERE name ILIKE $1", [`%${name}%`]);
        return result.rows;
    }
};

const getStyleById = async (id) => {
    const result = await pool.query("SELECT * FROM styles WHERE id = $1", [id]);
    return result.rows[0];
};

const createStyle = async (styles_photo, name, description) => {
    const result = await pool.query(
        "INSERT INTO styles (styles_photo, name, description) VALUES ($1, $2, $3) RETURNING *",
        [styles_photo, name, description]
    );
    return result.rows[0];
};

const updateStyle = async (id, styles_photo, name, description) => {
    const result = await pool.query(
        "UPDATE styles SET styles_photo = $1, name = $2, description = $3 WHERE id = $4 RETURNING *",
        [styles_photo, name, description, id]
    );
    return result.rows[0];
};

const deleteStyle = async (id) => {
    const result = await pool.query("DELETE FROM styles WHERE id = $1 RETURNING *", [id]);
    return result.rowCount > 0;
};

module.exports = {
    getStyles,
    getStyleById,
    createStyle,
    updateStyle,
    deleteStyle
};