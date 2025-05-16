const pool = require("../config/database");

const getUsers = async (name) => {
    if(!name) {
        const result = await pool.query("SELECT * FROM users");
        return result.rows;
    } else {
        const result = await pool.query("SELECT * FROM users WHERE users.name ILIKE $1", [`%${name}%`]);
        return result.rows;
    }
};

const getUserById = async (id) => {
    const result = await pool.query("SELECT * FROM users WHERE id = $1", [id]);
    return result.rows[0];
};

const createUser = async (name, username, email, perfil_photo, bio) => {
    const result = await pool.query("INSERT INTO users (name, username, email, perfil_photo, bio) VALUES ($1, $2, $3, $4, $5) RETURNING *", [name, username, email, perfil_photo, bio]);
    return result.rows[0];
};

module.exports = {getUsers, getUserById, createUser};