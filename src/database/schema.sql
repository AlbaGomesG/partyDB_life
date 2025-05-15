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

INSERT INTO attractions (attraction_photo, name, description)
VALUES 
('https://www.cnnbrasil.com.br/wp-content/uploads/sites/12/2024/11/alok-3-e1732129463931.jpg?w=1200&h=675&crop=1', 'Alok', 'Set exclusivo do DJ Alok, com os maiores hits da música eletrônica.'),
('https://upload.wikimedia.org/wikipedia/commons/2/23/Anitta_for_Attractive_Mindset_podcast_02.jpg', 'Anitta', 'Show imperdível com Anitta, trazendo sucessos nacionais e internacionais.'),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTCrS0TMFl3uyP8myP-tRF6WAz2ROIcUcMToA&s', 'Veigh', 'Rapper paulista com letras profundas e estilo trap melódico.'),
('https://akamai.sscdn.co/uploadfile/letras/fotos/a/f/7/5/af75f377c71b19169c8baf2328301939.jpg', 'Luan Santana', 'Romantismo e sertanejo em um show intimista com Luan Santana.'),
('https://s2-oglobo.glbimg.com/Mk_q8SQEZ0AkJjwbppB_kbKIXPE=/0x0:3648x4880/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_da025474c0c44edd99332dddb09cabe8/internal_photos/bs/2023/r/Y/2qMrFqSY6Me6iBpUz26w/102750176-sc-kayblack-lovesongs.jpg', 'Kayblack', 'Um dos maiores nomes do trap/funk, com letras marcantes e batidas envolventes.'),
('https://f.i.uol.com.br/fotografia/2023/03/23/1679597918641ca15e4afa9_1679597918_3x2_rt.jpg', 'MC Hariel', 'Funk de mensagem e presença de palco poderosa com MC Hariel.'),
('https://cdn-images.dzcdn.net/images/artist/46bf72b87250439262cc168d8fdcd240/1900x1900-000000-80-0-0.jpg', 'Jorge & Mateus', 'Dupla sertaneja apresenta um repertório repleto de sucessos.'),
('https://escaesco.com.br/wp-content/uploads/2023/11/IZA.jpg', 'IZA', 'A potência vocal de IZA em um espetáculo de R&B, pop e soul.'),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSwAK_Hi4BdSTrbACLE5V2H0rqsbsSZlC2Hig&s', 'Ludmilla', 'Funk, pagode e pop num show cheio de atitude com Ludmilla.'),
('https://web.portalsucesso.com.br/wp-content/uploads/2023/12/mc-don-juan-19-dez.png', 'MC Don Juan', 'Funk consciente e dançante com um dos maiores nomes da cena.');
