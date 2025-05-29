require("dotenv").config();
const express = require("express");
const cors = require("cors");


const usersRoutes = require("./src/routes/usersRoutes");
const authRoutes = require("./src/routes/authRoutes");
const pool = require("./src/config/database");
const eventsRoutes = require("./src/routes/eventsRoutes");
const postsRoutes = require("./src/routes/postsRoutes");
const apiKeyMiddleware = require ("./src/config/apiKey")


const path = require("path");
const app = express();

app.use(apiKeyMiddleware)

app.use(cors());
app.use(express.json());

app.use("/api/users", usersRoutes);
app.use("/api/auth", authRoutes);
app.use("/api/events", eventsRoutes);
app.use("/api/posts", postsRoutes);


app.use("/uploads", express.static(path.join(__dirname, "uploads")));

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
    console.log(`🚀 Servidor rodando em http://localhost:${PORT}`);
});
