const pool = require("../config/database");

const getAllUsersInfo = async (name) => {
    if (!name) {
        const result = await pool.query("SELECT * FROM users_info");
        return result.rows;
    } else {
        const result = await pool.query("SELECT * FROM users_info WHERE name ILIKE $1", [`%${name}%`]);
        return result.rows;
    }
}

const getUserInfoById = async (userId) => {
    const result = await pool.query("SELECT * FROM users_info WHERE id = $1", [userId]);
    return result.rows[0];
};

const updateUserInfo = async (id, name, bio) => {
    const result = await pool.query("UPDATE users_info SET name = $1, bio = $2 WHERE id = $3 RETURNING *", [name, bio, id]);
    return result.rows[0];
}

const deleteUserInfo = async (id) => {
    const result = await pool.query("DELETE FROM users_info WHERE id = $1 RETURNING *", [id]);
    if (result.rowCount === 0) {
        return { error: "Informações do usuário não encontradas!" };
    }
    return { message: "Informações do usuário deletadas com sucesso!" };
};

module.exports = { getAllUsersInfo, getUserInfoById, updateUserInfo, deleteUserInfo };

