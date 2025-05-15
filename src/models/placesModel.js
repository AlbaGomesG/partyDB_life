const pool = require("../config/database");

const getPlaces = async (req, res) => {
    const result = await pool.query("SELECT * FROM places");
    return result.rows;
};

const getPlaceById = async (id) => {
    const result = await pool.query("SELECT * FROM places WHERE id = $1", [id]);
    return result.rows[0];
};

module.exports = { getPlaces, getPlaceById };