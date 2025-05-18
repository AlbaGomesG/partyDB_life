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

module.exports = { getStyles, getStyleById };