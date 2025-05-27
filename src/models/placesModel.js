const pool = require("../config/database");

const getPlaces = async () => {
    const result = await pool.query("SELECT * FROM places");
    return result.rows;
};

const getPlaceById = async (id) => {
    const result = await pool.query("SELECT * FROM places WHERE id = $1", [id]);
    return result.rows[0];
};

const createPlace = async (name, description, places_photo) => {
    const result = await pool.query(
        "INSERT INTO places (name, description, places_photo) VALUES ($1, $2, $3) RETURNING *",
        [name, description, places_photo]
    );
    return result.rows[0];
};

const updatePlace = async (id, description, places_photo) => {
    const result = await pool.query(
        "UPDATE places SET description = $1, places_photo = $2 WHERE id = $3 RETURNING *",
        [description, places_photo, id]
    );
    return result.rows[0];
};

const deletePlace = async (id) => {
    const result = await pool.query("DELETE FROM places WHERE id = $1 RETURNING *", [id]);
    if (result.rowCount === 0) {
        return { error: "Lugar não encontrado!" };
    }
    return { message: "Lugar deletado com sucesso!" };
};

module.exports = {
    getPlaces,
    getPlaceById,
    createPlace,
    updatePlace,
    deletePlace
};