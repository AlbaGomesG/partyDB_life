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

const createAttraction = async (attractions_photo, name, description) => {
    const result = await pool.query("INSERT INTO attractions (attractions_photo, name, description) VALUES ($1, $2, $3) RETURNING *", [attractions_photo, name, description]);
    return result.rows[0];
};

const updateAttraction = async (id, attractions_photo, name, description) => {
    const query = `
        UPDATE attractions
        SET attractions_photo = $1, name = $2, description = $3
        WHERE id = $4
        RETURNING *;
    `;
    const values = [attractions_photo, name, description, id];
    const result = await pool.query(query, values); 
    return result.rows[0];
};

module.exports = { updateAttraction };
const deleteAttraction = async (id) => {
    const result = await pool.query("DELETE FROM attractions WHERE id = $1 RETURNING *", [id]);
    if (result.rowCount === 0) {
        return { error: "Atração não encontrada!" };
    }
    return { message: "Atração deletada com sucesso!" };
};

module.exports = { getAttractions, getAttractionById, createAttraction, updateAttraction, deleteAttraction };