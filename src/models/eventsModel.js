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

const createEvent = async (title, local, time_start, time_end, description, event_photo, events_rules, party_itens, take_products, attractions, styles, hashtags) => {
    const result = await pool.query(
        "INSERT INTO events (title, local, time_start, time_end, description, event_photo, events_rules, party_itens, take_products, attractions, styles, hashtags) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12) RETURNING *",
        [title, local, time_start, time_end, description, event_photo, events_rules, party_itens, take_products, attractions, styles, hashtags]
    );
    return result.rows[0];
};

const updateEvent = async (id, title, local, time_start, time_end, description, event_photo, events_rules, party_itens, take_products, attractions, styles, hashtags) => {
    const result = await pool.query(
        "UPDATE events SET title = $1, local = $2, time_start = $3, time_end = $4, description = $5, event_photo = $6, events_rules = $7, party_itens = $8, take_products = $9, attractions = $10, styles = $11, hashtags = $12 WHERE id = $13 RETURNING *",
        [title, local, time_start, time_end, description, event_photo, events_rules, party_itens, take_products, attractions, styles, hashtags, id]
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