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

module.exports = { getAttractions };