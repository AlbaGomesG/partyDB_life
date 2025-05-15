require("dotenv").config();
const express = require("express");
const cors = require("cors");
const placesRoutes = require("./src/routes/placesRoutes");
const usersRoutes = require("./src/routes/usersRoutes");

const app = express();
app.use(cors());
app.use(express.json());

app.use("/api/places", placesRoutes);
app.use("/api/users", usersRoutes);

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
    console.log(`🚀 Servidor rodando em http://localhost:${PORT}`);
});
