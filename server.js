require("dotenv").config();
const express = require("express");
const cors = require("cors");
const placesRoutes = require("./src/routes/placesRoutes");
const attractionsRoutes = require("./src/routes/attractionsRoutes");
const stylesRoutes = require("./src/routes/stylesRoutes");
const usersRoutes = require("./src/routes/usersRoutes");
const path = require("path");

const app = express();
app.use(cors());
app.use(express.json());

app.use("/api/places", placesRoutes);
app.use("/api/users", usersRoutes);
app.use("/api/attractions", attractionsRoutes);
app.use("/api/styles", stylesRoutes);
app.use("/uploads", express.static(path.join(__dirname, "uploads")));

const PORT = process.env.PORT || 4000;
app.listen(PORT, () => {
    console.log(`🚀 Servidor rodando em http://localhost:${PORT}`);
});
