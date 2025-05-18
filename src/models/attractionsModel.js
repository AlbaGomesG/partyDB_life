const pool = require("../config/database");

const getAttractions = async (name) => {
    if (!name) {
        const result = await pool.query("SELECT * FROM attractions")
        return result.rows;
    } else {
        const result = await pool.query("SELECT * FROM attractions WHERE attractions.name ILIKE $1", [`%${name}%`]);
        return result.rows;
    }
};

const getAttractionById = async (id) => {
    const result = await pool.query("SELECT * FROM attractions WHERE id = $1", [id]);
    return result.rows[0];
};

const createAttraction = async (attraction_photo, name, description) => {
    const result = await pool.query("INSERT INTO attractions (attraction_photo, name, description) VALUES ($1, $2, $3) RETURNING *", [attraction_photo, name, description]);
    return result.rows[0];
};

module.exports = { getAttractions, getAttractionById, createAttraction };