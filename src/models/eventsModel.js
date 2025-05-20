const pool = require("../config/database");

const getEvents = async (name) => {
    if (!name) {
        const result = await pool.query("SELECT * FROM events");
        return result.rows;
    } else {
        const result = await pool.query("SELECT * FROM events WHERE events.name ILIKE $1", [`%${name}%`]);
        return result.rows;
    }
};

const getEventById = async (id) => {
    const result = await pool.query("SELECT * FROM events WHERE id = $1", [id]);
    return result.rows[0];
};

const createEvent = async (event_photo, name, description) => {
    const result = await pool.query("INSERT INTO events (title, place_id, attra) VALUES ($1, $2, $3) RETURNING *", [event_photo, name, description]);
    return result.rows[0];
};