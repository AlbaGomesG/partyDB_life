const jwt = require('jsonwebtoken');
require("dotenv").config();

function verifyToken(req, res, next) {
    const token = req.headers['authorization']?.split(' ')[1]; // Extrair o token do cabeçalho

    if (!token) {
        return res.status(403).json({ message: 'Token não fornecido' });
    }

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET); // Verificar o token
        req.user = decoded; // Adicionar os dados do usuário à requisição
        next();
    } catch (error) {
        return res.status(401).json({ message: 'Token inválido' });
    }
}

module.exports = { verifyToken };