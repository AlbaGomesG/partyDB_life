CREATE DATABASE partylife;

\c partylife;

CREATE TABLE places (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    localization VARCHAR(255) NOT NULL,
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



     
    
