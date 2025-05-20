const pool = require("../config/database");

const getPosts = async (name) => {
    if (!name) {
        const result = await pool.query("SELECT * FROM posts");
        return result.rows;
    } else {
        const result = await pool.query("SELECT * FROM posts WHERE title ILIKE $1", [`%${name}%`]);
        return result.rows;
    }
};

const getPostById = async (id) => {
    const result = await pool.query("SELECT * FROM posts WHERE id = $1", [id]);
    return result.rows[0];
};

const createPost = async (user_id, event_id, image_post, content, data_postagem) => {
    const result = await pool.query("INSERT INTO posts (user_id, event_id, image_post, content, data_postagem) VALUES ($1, $2, $3) RETURNING *", [user_id, event_id, image_post, content, data_postagem]);
    return result.rows[0];
};

const updatePost = async (id, user_id, event_id, image_post, content, data_postagem) => {
    const result = await pool.query(
        "UPDATE posts SET title = $1, place_id = $2, attraction_id = $3, style_id = $4, time_start = $5, time_end = $6, description = $7, event_photo = $8 WHERE id = $9 RETURNING *",
        [id, user_id, event_id, image_post, content, data_postagem]
    );
    return result.rows[0];
};

const deletePost = async (id) => {
    const result = await pool.query("DELETE FROM posts WHERE id = $1 RETURNING *", [id]);
    if (result.rowCount === 0) {
        return { error: "Post não encontrado!" };
    }
    return { message: "Post deletado com sucesso!" };
};              

module.exports = { getPosts, getPostById, createPost, updatePost, deletePost };