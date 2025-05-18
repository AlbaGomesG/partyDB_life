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

const updateUser = async (id, name, username, bio) => {
    const result = await pool.query("UPDATE users SET name = $1, username = $2, bio = $3 WHERE id = $4 RETURNING *", [name, username, bio, id]);
    return result.rows[0];
}

module.exports = {getUsers, getUserById, createUser, updateUser, updateUser};