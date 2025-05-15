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
)

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    perfil_photo TEXT,
    bio TEXT
    );

    CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    localization VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    time_start TIME,
    time_end TIME,
    description TEXT,
    event_photo TEXT,
    );

    CREATE TABLE events_rules (
    id SERIAL PRIMARY KEY,
    event_id INT NOT NULL,
    description TEXT NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE
    );

    CREATE TABLE itens_festa (
    id SERIAL PRIMARY KEY,
    event_id INT NOT NULL,
    item VARCHAR(100) NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE
    );

    CREATE TABLE party_itens (
    id SERIAL PRIMARY KEY,
    event_id INT NOT NULL,
    item VARCHAR(100) NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE
    );

    CREATE TABLE take_products (
    id SERIAL PRIMARY KEY,
    event_id INT NOT NULL,
    description VARCHAR(200) NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE
);

CREATE TABLE hashtags (
    id SERIAL PRIMARY KEY,
    event_id INT NOT NULL,
    hashtag VARCHAR(50) NOT NULL,
      FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE
);


//inserts

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
