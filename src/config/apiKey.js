const apiKeyMiddleware = (req, res, next) => {
    const apiKey = req.headers['x-api-key'];
    const serverKey = process.env.API_KEY;
    
    if (!clientKey || cilentKey !== serverKey) {
        return res.status(403).json({ error: 'Chave de API inválida ou ausente' });
    }
    
    next();
    };

    module.exports = apiKeyMiddleware;