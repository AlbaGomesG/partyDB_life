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

const createUser = async (name, email, senha) => {
    const hashedPassword = await bcrypt.hash(senha, 10);
    const result = await pool.query(
        "INSERT INTO users (name, email, senha) VALUES ($1, $2, $3) RETURNING *",
        [name, email, hashedPassword ]
    );
    return result.rows[0];
};

const updateUser = async (id, name) => {
    const result = await pool.query("UPDATE users SET name = $1, WHERE id = $3 RETURNING *", [name, id]);
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