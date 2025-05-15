const pool = require("../config/database");

const getPlaces = async (req, res) => {
    const result = await pool.query("SELECT * FROM places");
    return result.rows;
};

module.exports = { getPlaces };