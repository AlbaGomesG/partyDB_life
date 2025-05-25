const pool = require("../config/database");

const getIntegrantes = async (name) => {
    if (!name) {
        const result = await pool.query("SELECT * FROM integrantes");
        return result.rows;
    } else {
        const result = await pool.query(
            "SELECT * FROM integrantes WHERE name ILIKE $1",
            [`%${name}%`]
        );
        return result.rows;
    }
};

const getIntegranteById = async (id) => {
    const result = await pool.query("SELECT * FROM integrantes WHERE id = $1", [id]);
    return result.rows[0];
};

const createIntegrante = async (photo_integrante, name, funcao_equipe) => {
    const result = await pool.query(
        "INSERT INTO integrantes (photo_integrante, name, funcao_equipe) VALUES ($1, $2, $3) RETURNING *",
        [photo_integrante, name, funcao_equipe]
    );
    return result.rows[0];
};

const updateIntegrante = async (id, name, funcao_equipe) => {
    const result = await pool.query(
        "UPDATE integrantes SET name = $1, funcao_equipe = $2 WHERE id = $3 RETURNING *",
        [name, funcao_equipe, id]
    );
    return result.rows[0];
};

const deleteIntegrante = async (id) => {
    const result = await pool.query("DELETE FROM integrantes WHERE id = $1 RETURNING *", [id]);
    if (result.rowCount === 0) {
        return { error: "Integrante nao encontrado!" };
    }
    return { message: "Integrante deletado com sucesso!" };
};

module.exports = { getIntegrantes, getIntegranteById, createIntegrante, updateIntegrante, deleteIntegrante };