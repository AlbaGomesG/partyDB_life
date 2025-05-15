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

module.exports = {getUsers}