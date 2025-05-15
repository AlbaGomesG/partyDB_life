const pool = require("../config/database");

const getPlaces = async (req, res) => {
    const result = await pool.query("SELECT * FROM places");
    return result.rows;
};

const getPlaceById = async (id) => {
    const result = await pool.query("SELECT * FROM places WHERE id = $1", [id]);
    return result.rows[0];
};

const createPlace = async (name, description, place_photo) => {
    const result = await pool.query("INSERT INTO places (name, description, place_photo) VALUES ($1, $2, $3) RETURNING *", [name, description, place_photo]);
    return result.rows[0];
};

const updatePlace = async (id, description, place_photo) => {
    const result = await pool.query("UPDATE places SET description = $1, place_photo = $2 WHERE id = $3 RETURNING *", [description, place_photo, id]);
    return result.rows[0];
};

module.exports = { getPlaces, getPlaceById, createPlace, updatePlace };