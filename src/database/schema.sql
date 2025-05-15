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
('Noite Branca','Uma noite all white com convidados selecionados, champagne e muita elegância.', 'noitebranca.jpg'),
('Garden Secret', 'Coquetel privado em um jardim secreto, com finger foods e jazz ao vivo.', 'gardensecret.jpg'),
('Vibes Select', 'Festa fechada com line-up especial e acesso restrito para convidados.', 'vibesselect.jpg'),
('Aurora Exclusive', 'Sunrise party para um grupo seleto, com café da manhã gourmet e música chill.', 'auroraexclusive.jpg'),
('Clube 88', 'Uma experiência noturna reservada para membros e convidados VIP.', 'clube88.jpg'),
('Círculo Dourado', 'Evento black-tie com gastronomia refinada e performances ao vivo.', 'circulodourado.jpg'),
('Ilha Privada','Festa em ilha exclusiva, com transporte incluso e serviço all inclusive.', 'ilhaprivada.jpg'),
('Espelho da Lua', 'Celebração intimista sob a lua cheia, com pista silenciosa e open bar de drinks autorais.', 'espelhodalua.jpg');

