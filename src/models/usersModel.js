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

module.exports = {getUsers, getUserById}