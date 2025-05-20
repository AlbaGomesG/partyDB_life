const pool = require("../config/database");

const getEvents = async (name) => {
    if (!name) {
        const result = await pool.query("SELECT * FROM events");
        return result.rows;
    } else {
        const result = await pool.query("SELECT * FROM events WHERE title ILIKE $1", [`%${name}%`]);
        return result.rows;
    }
};

const getEventById = async (id) => {
    const result = await pool.query("SELECT * FROM events WHERE id = $1", [id]);
    return result.rows[0];
};

const createEvent = async (title, place_id, attraction_id, style_id, time_start, time_end, description, event_photo) => {
    const result = await pool.query(
        "INSERT INTO events (title, place_id, attraction_id, style_id, time_start, time_end, description, event_photo) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *",
        [title, place_id, attraction_id, style_id, time_start, time_end, description, event_photo]
    );
    return result.rows[0];
};

const updateEvent = async (id, title, place_id, attraction_id, style_id, time_start, time_end, description, event_photo) => {
    const result = await pool.query(
        "UPDATE events SET title = $1, place_id = $2, attraction_id = $3, style_id = $4, time_start = $5, time_end = $6, description = $7, event_photo = $8 WHERE id = $9 RETURNING *",
        [title, place_id, attraction_id, style_id, time_start, time_end, description, event_photo, id]
    );
    return result.rows[0];
};

const deleteEvent = async (id) => {
    const result = await pool.query("DELETE FROM events WHERE id = $1 RETURNING *", [id]);
    if (result.rowCount === 0) {
        return { error: "Evento não encontrado!" };
    }
    return { message: "Evento deletado com sucesso!" };
};

module.exports = { getEvents, getEventById, createEvent, updateEvent, deleteEvent };