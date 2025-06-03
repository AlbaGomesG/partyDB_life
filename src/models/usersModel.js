const pool = require("../config/database");
const bcrypt = require('bcryptjs');

const getUsers = async (name) => {
    if(!name) {
        const result = await pool.query("SELECT * FROM users");
        return result.rows;
    } else {
        const result = await pool.query("SELECT * FROM users WHERE users.name ILIKE $1", [`%${name}%`]);
        return result.rows;
    }
};

const getUserById = async (userId) => {
    const result = await pool.query("SELECT * FROM users WHERE id = $1", [userId]);
    return result.rows[0];
};

const createUser = async (name, username, email, senha, perfil_photo) => {
    const hashedPassword = await bcrypt.hash(senha, 10);
    const result = await pool.query(
        "INSERT INTO users (name, username, email, senha, perfil_photo) VALUES ($1, $2, $3, $4, $5) RETURNING *",
        [name, username, email, hashedPassword, perfil_photo]
    );
    return result.rows[0];
};

const updateUser = async (id, name, username) => {
    const result = await pool.query("UPDATE users SET name = $1, username = $2 WHERE id = $3 RETURNING *", [name, username, id]);
    return result.rows[0];
}

const deleteUser = async (id) => {
    const result = await pool.query("DELETE FROM users WHERE id = $1 RETURNING *", [id]);
    if (result.rowCount === 0) {
        return {error: "Usuário não encontrado!"};
    }
    return {message: "Usuário deletado com sucesso!"};
};

module.exports = {getUsers, getUserById, createUser, updateUser, deleteUser};