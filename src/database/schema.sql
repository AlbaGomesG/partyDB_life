CREATE DATABASE partylife;

\c partylife;

CREATE TABLE places (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    place_photo TEXT
);

CREATE TABLE attractions (
    id SERIAL PRIMARY KEY,
    attraction_photo TEXT,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE styles (
    id SERIAL PRIMARY KEY,
    style_photo TEXT,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    place_id INTEGER NOT NULL REFERENCES places(id) ON DELETE SET NULL,
    attraction_id INTEGER,
    FOREIGN KEY (attraction_id) REFERENCES attractions (id) ON DELETE SET NULL,
    style_id INTEGER NOT NULL REFERENCES styles (id) ON DELETE SET NULL,
    time_start TIME,
    time_end TIME,
    description TEXT,
    event_photo TEXT      
);

    CREATE TABLE events_rules (
    id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL REFERENCES events(id) ON DELETE SET NULL,
    description TEXT NOT NULL
);

    CREATE TABLE itens_festa (
    id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL REFERENCES events(id) ON DELETE SET NULL,
    item VARCHAR(100) NOT NULL
);

    CREATE TABLE party_itens (
    id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL REFERENCES events(id) ON DELETE SET NULL,
    item VARCHAR(100) NOT NULL
);

    CREATE TABLE take_products (
    id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL REFERENCES events(id) ON DELETE SET NULL,
    description VARCHAR(200) NOT NULL
);

CREATE TABLE hashtags (
    id SERIAL PRIMARY KEY,
    event_id INTEGER NOT NULL REFERENCES events(id) ON DELETE SET NULL,
    hashtag VARCHAR(50) NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    perfil_photo TEXT,
    bio TEXT
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE SET NULL,
    event_id INTEGER NOT NULL REFERENCES events(id) ON DELETE SET NULL,
    image_post TEXT NOT NULL,
    content VARCHAR(300) NOT NULL,
    data_postagem DATE DEFAULT CURRENT_DATE
);

// inserts

INSERT INTO places (name, description, place_photo)
VALUES 
('Sunset Privé', 'Evento exclusivo com DJs renomados, open bar premium e vista para o pôr do sol.', 'https://dicasdefortalezaejeri.com.br/wp-content/uploads/sites/29/2022/03/clubventos-jeri-jpeg.webp'),
('Noite Branca','Uma noite all white com convidados selecionados, champagne e muita elegância.', 'https://api.guiaeventosrta.pt.stage.vf-portal.com/uploads/1/5/Eventos_2023/Agosto/festas%20e%20festivais_loule_noite%20branca.jpg?6vMMyCBjzaHhJMsO1jlZERa6Nl2XfVnbYWdDFVLRQIBlfgHa_JNhIbfWs_z0p-6O'),
('Garden Secret', 'Coquetel privado em um jardim secreto, com finger foods e jazz ao vivo.', 'https://cdn0.casamentos.com.br/usr/0/2/2/8/cfb_2x_980946.jpg'),
('Vibes Select', 'Festa fechada com line-up especial e acesso restrito para convidados.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLo4dChuDihnwxFC62qzuy-9ylwloEGvMWCg&s'),
('Aurora Exclusive', 'Sunrise party para um grupo seleto, com café da manhã gourmet e música chill.', 'https://cdn0.casamentos.com.br/article-vendor/0740/original/1280/jpg/121966267-130571131784232-8897296669927387429-n_13_170740-165359987664134.jpeg'),
('Clube 88', 'Uma experiência noturna reservada para membros e convidados VIP.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSn01glhZ7K5dS60Z7byD_n5nxDi68Qmwtsrg&s'),
('Círculo Dourado', 'Evento black-tie com gastronomia refinada e performances ao vivo.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxGHVgP-HaaLQm8j0EmtWTSbncGCtWduS1UQ&s'),
('Rodeio de Americana','O maior rodeio do Brasil, com montarias emocionantes e shows de artistas renomados.', 'https://i.postimg.cc/SxV5v2st/rodeio-americana-palco-1.webp'),
('Gate 22', 'Balada exclusiva com DJs de renome, open bar e atmosfera futurista até o amanhecer.', 'https://api.wegoout.com.br/wp-uploads/wp-images/2023/05/gate22_2.jpg');

