DROP DATABASE IF EXISTS partylife;
CREATE DATABASE partylife WITH ENCODING 'UTF8';

\c partylife;

CREATE TABLE places (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    places_photo TEXT
);

CREATE TABLE attractions (
    id SERIAL PRIMARY KEY,
    attractions_photo TEXT,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE styles (
    id SERIAL PRIMARY KEY,
    styles_photo TEXT,
    name VARCHAR(255) NOT NULL,
    description TEXT
);

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    place_id INTEGER NULL,
    attraction_id INTEGER NULL,
    style_id INTEGER NULL,
    time_start TIMESTAMP,
    time_end TIMESTAMP,
    description TEXT,
    event_photo TEXT,
    events_rules TEXT,
    party_itens TEXT,
    take_products TEXT,
    hashtags TEXT,
    CONSTRAINT fk_event_place FOREIGN KEY (place_id) REFERENCES places(id) ON DELETE SET NULL,
    CONSTRAINT fk_event_attraction FOREIGN KEY (attraction_id) REFERENCES attractions(id) ON DELETE SET NULL,
    CONSTRAINT fk_event_style FOREIGN KEY (style_id) REFERENCES styles(id) ON DELETE SET NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    senha VARCHAR(100) NOT NULL, 
    perfil_photo TEXT,
    bio TEXT
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL,
    event_id INTEGER NOT NULL,
    image_post TEXT NOT NULL,
    content VARCHAR(300) NOT NULL,
    data_postagem DATE DEFAULT CURRENT_DATE,
    CONSTRAINT fk_post_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_post_event FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE
);

CREATE TABLE integrantes (
    id SERIAL PRIMARY KEY,
    photo_integrante TEXT,
    name VARCHAR(255) NOT NULL,
    funcao_equipe VARCHAR(255) NOT NULL
);

INSERT INTO places (name, description, places_photo) VALUES
('Sunset Prive', 'Evento exclusivo com DJs renomados, open bar premium e vista para o por do sol.', 'https://example.com/sunset_prive.jpg'),
('Noite Branca', 'Uma noite all white com convidados selecionados, champagne e muita elegancia.', 'https://example.com/noite_branca.jpg'),
('Garden Secret', 'Coquetel privado em um jardim secreto, com finger foods e jazz ao vivo.', 'https://example.com/garden_secret.jpg'),
('Vibes Select', 'Festa fechada com line-up especial e acesso restrito para convidados.', 'https://example.com/vibes_select.jpg'),
('Aurora Exclusive', 'Sunrise party para um grupo seleto, com cafe da manha gourmet e musica chill.', 'https://example.com/aurora_exclusive.jpg'),
('Clube 88', 'Uma experiencia noturna reservada para membros e convidados VIP.', 'https://example.com/clube_88.jpg'),
('Circulo Dourado', 'Evento black-tie com gastronomia refinada e performances ao vivo.', 'https://example.com/circulo_dourado.jpg'),
('Rodeio de Americana', 'O maior rodeio do Brasil, com montarias emocionantes e shows de artistas renomados.', 'https://example.com/rodeio_americana.jpg'),
('Gate 22', 'Balada exclusiva com DJs de renome, open bar e atmosfera futurista ate o amanhecer.', 'https://example.com/gate_22.jpg'),
('Festival Tropical', 'Festival com ritmos latinos e musica ao vivo, ambiente descontraido e muito calor humano.', 'https://example.com/festival_tropical.jpg'),
('Lounge Vip', 'Ambiente intimista com drinks sofisticados e musica lounge, perfeito para relaxar.', 'https://example.com/lounge_vip.jpg'),
('Underwater Party', 'Festa tematica subaquatica com DJs ao vivo e luzes incriveis em um cenario surreal.', 'https://example.com/underwater_party.jpg'),
('Masquerade Ball', 'Baile de mascaras elegante com traje formal e um toque de misterio.', 'https://example.com/masquerade_ball.jpg'),
('Rooftop Experience', 'Festa exclusiva no topo do predio com uma vista deslumbrante da cidade e muita musica eletronica.', 'https://example.com/rooftop_experience.jpg'),
('Jungle Escape', 'Festa no meio da natureza, com tematica de jungle e DJs trazendo o melhor do house e techno.', 'https://example.com/jungle_escape.jpg'),
('Secret Garden', 'Evento secreto em um jardim encantado com musica ao vivo e gastronomia sofisticada.', 'https://example.com/secret_garden.jpg'),
('Neon Lights', 'Festa com luzes neon, arte interativa e musica para dancar ate amanhecer.', 'https://example.com/neon_lights.jpg'),
('Glamour Night', 'Noite glamourosa com tapete vermelho, moda e shows de artistas internacionais.', 'https://example.com/glamour_night.jpg'),
('Cosmic Journey', 'Evento futurista com decoracao cosmica, DJs e uma imersao sonora de tirar o folego.', 'https://example.com/cosmic_journey.jpg'),
('Carnaval Prive', 'Festa de carnaval exclusiva com desfiles e shows de samba ao vivo.', 'https://example.com/carnaval_prive.jpg');

INSERT INTO attractions (attractions_photo, name, description) VALUES
('https://musicainstantanea.com.br/wp-content/uploads/2022/07/Billie-Eilish-700x700.jpeg', 'Billie Eilish', 'Show de pop e eletronico com uma performance unica e energetica.'),
('https://vejario.abril.com.br/wp-content/uploads/2024/09/o-que-anitta-acha-de-fernanda-young.jpg?quality=70&strip=info&w=414&h=280&crop=1', 'Anitta', 'Performance de pop brasileiro com uma mistura de funk e R&B.'),
('https://cdn.britannica.com/17/249617-050-4575AB4C/Ed-Sheeran-performs-Rockefeller-Plaza-Today-Show-New-York-2023.jpg', 'Ed Sheeran', 'Show de pop e musica acustica, com grandes sucessos e emocoes no palco.'),
('https://admin.cnnbrasil.com.br/wp-content/uploads/sites/12/2024/11/alok-3-e1732129463931.jpg?w=1200&h=675&crop=1', 'Alok', 'DJ mundialmente renomado com uma performance de musica eletronica.'),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVNClyVmzlnQ5b5h4pAgY5ZvoLMCVpa8aB6w&s', 'Hariel', 'Performance de rap e trap com letras intensas e um show de energia.'),
('https://dicionariompb.com.br/wp-content/uploads/2021/04/anavitoria.jpeg', 'Anavitoria', 'Show de pop romantico e intimista ao ar livre, trazendo boas vibracoes.'),
('https://preview.redd.it/today-is-travis-scotts-birthday-april-30th-v0-b9ula4hdpixc1.jpeg?width=640&crop=smart&auto=webp&s=85e69f7e9ec443d74fcddef6a9640d8839313107', 'Travis Scott', 'Rap e trap com batidas pesadas, trazendo uma vibe futurista e intensa.'),
('https://imagem.natelinha.uol.com.br/grande/ivete-sangalo-musica-boa-ao-vivo_330347b888dfca046a008c66fadc5ae571dd71ef.jpeg', 'Ivete Sangalo', 'Show de axe, com muito ritmo e energia, para todos dancarem ate amanhecer.'),
('https://dicionariompb.com.br/wp-content/uploads/2021/04/Jorge-Mateus.jpg', 'Jorge & Mateus', 'Sertanejo universitario com grandes sucessos que marcaram geracoes.'),
('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTC0DEpR5b0kq34KN7boFirecsxjBY19GML004uLfDp_THsTV3rxR0BcHnm6UhpYfZ9rOo&usqp=CAU', 'Dua Lipa', 'Performance de pop internacional com coreografias e hits globais.'),
('https://hips.hearstapps.com/hmg-prod/images/justin-bieber-gettyimages-1202421980.jpg?resize=1200:*', 'Justin Bieber', 'Show de pop e R&B com sucessos que marcaram epocas.'),
('https://upload.wikimedia.org/wikipedia/commons/8/81/Metallica_March_2024.jpg', 'Metallica', 'Banda de rock com um show eletrizante e classicos do heavy metal.'),
('https://forbes.com.br/wp-content/uploads/2024/11/beyonce-curso-yale.jpg', 'Beyonce', 'Performance de R&B e pop com coreografias e uma presenca de palco unica.'),
('https://beatforbeat.com.br/site/wp-content/uploads/2017/08/Avicii.jpg', 'Avicii', 'Tributo ao DJ Avicii com seus maiores sucessos de musica eletronica.'),
('https://rollingstone.com.br/media/uploads/rihanna_-_evan_agostiniinvisionap.jpg', 'Rihanna', 'Show de pop e R&B com hits que marcaram geracoes.'),
('https://admin.cnnbrasil.com.br/wp-content/uploads/sites/12/2022/04/Coldplay-Credit-James-Marcus-Haney-1.jpg', 'Coldplay', 'Banda de rock alternativo com um show cheio de emocao e luzes.'),
('https://assets.portalleodias.com/2024/04/katy-perry-quebra-hiato-de-6-anos-e-volta-ao-brasil-para-o-rock-in-rio-1703947393.webp', 'Katy Perry', 'Performance de pop com figurinos coloridos e hits animados.'),
('https://ogimg.infoglobo.com.br/in/25183869-2f3-b54/FT1086A/760/drake.jpeg.jpg', 'Drake', 'Show de rap e R&B com sucessos globais e uma vibe unica.'),
('https://img.20mn.fr/lshW8CcDRTiByAp5LcTtig/1444x920_the-weeknd', 'The Weeknd', 'Performance de R&B e pop com uma atmosfera misteriosa e hits globais.');

INSERT INTO styles (styles_photo, name, description) VALUES
('https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEUStL2umYG%2F8fMw3%2FYshBJvfhxIADFxTutiguPlrE69NopuvKh6KRZO%2FGb1An7Z5VCiH5ugD6BrVbbXfxChG390FKWFWkY32G2Pomr974XdhFWfh5gEo%2B3CEiigTUcw8C849RYArCFIrU%2FLe6AO4O48pEG0bMyxXFQOpcbFRH43p%2FTBgniqnKESA39hkUAYyUC0MYBk57AmOx6u7VJZgldAc8MskkvxZZ9ccgiZCwKbqsOG5tzk2dH%2Bz4kUo2%2BJ%2Fz7Q3nPhSeobTrACgsYstrQmP6J6kARK3xEr%2FfeIOxdkljplBqhxCwNHGimEBAHCgkRI9ZYpRJb7wR8G6S36fmyCNhTtArQFcptOI%2BihuPF479pDyN4W%2BOb4fKkVfxD%2FySfWU%2FbTal%2B9ewMG%2FBlC5X4pgQGDZ9m%2FF5WeKVnq5wiCraqKkjc%2FdFGDBx2mMRuFwTO4F9Rzsv7i%2FnhowhRT8cvnTQQPdLP2mZob5tOUX1m8iAnXdKtAvxMNM26AZHwQku%2BhFAZnHUf%2FD2pAYL%2BbkV%2Fg6ZjQ958QDfP1vbkAihzMtC9NJ3jZ0S%2FgAjOg6izPCNY%3D&allow_caching=true&sz=w512-k', 'Eletronica', 'Festas com musica eletronica.'),
('https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEXXp2ir3CDwL5GzPQra0fZ2FT0o6RNBg8NGq9lpxmhipis%2BzauFS9N%2FX2MliFZE5sh0S6%2BM2d6Wt7mLATLAPcFOI7mOMWp9eKJwF2IzESfn8CaJwTpUtRi09UUCymtVKR6NB9leEM57Fbz4xU%2B%2F4oqWC9hUigJKNOMHFtMinZDjqDWnd618xKk99Fa2L2TVJ0vONn8EPUW5qWmRSlT8kcfDx8JanlmBJ6VUvx8ei81LW1r%2BINijHjoRh1BpJBjkkP7vbwUnjJiZ%2FFNkRRgnlgMTIZh3lddcrWM8QMfJ932RvHUqn74nLGFlxW%2FSqmGt6fp0EY8bSzJOESNRny6CtV5gfIILv95mEiTPWqCzqQv%2BCWvVWF6v9mKvTS%2BIB9RUQl9h5i7DNYTPbuTfFfdfY0XrbHg5pZ6IaaXHRIBJ1X0LTpSHX7cPj3xvStU4Lh0oyrQFAme8EzKTDzBO6uYMO1FbPLe8EmioC%2Bf1ClsCkngBlXGmhREkXTbb%2Faq2XMF%2BEWk3hYlYAhjjd1pusEie%2BEob0Il7Dy0AN8RhAXwRiQy1WDSBnpkq%2FZIP0AGv64s%3D&allow_caching=true&sz=w958-h944&auditContext=forDisplay', 'Rock', 'Eventos com bandas de rock ao vivo.'),
('https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEX97E6SiQCeMWkHIIkMk6hTBK0gbvWYxX3hhizaHWE%2FwSxIFIRNJFBzzZVDW5nRGz4tuarAw7ggEj0r39lDAcVs9iWa8INJ0yg328%2FRRvoiYw8z0ChWFzB3nHOUj1HaoBns5WHReXDEf55EZey5JJebs104JZIBaoTlsM4apd0EloJ623ZHrH60KW%2Bt%2FNV7zG8LVB7%2Fll0DAa7Vx1jAZcwdCqEGZWXRlRg%2FsfHkWclR6WGqlZOltOywFpOEj4MfjpfPdKTZfkam5nJLZFvmFuw8p24%2F0VKfAfOTpArZX5HPxFP60WNdz9Lrcdvz5YTshd1tiKowzt4rCPJSOIVnGSP%2BFZV0xDbyhBr%2B2e%2B82O6RMJIOlhH20N%2BIGha3%2FH1bLGiT%2FkTy5J4Rm7nlL2N3vREz8s8PACak5je0ZSYXSZ7SHN2BodpyqHVETi0arOB%2BevSo6ezQhPYtnPlQVQ0yZjuTa%2FwRs7f0KycyeXGkPTY7ue5p2oGl7ikSkzrTAbislt9h9mjFO6VmINRJp7y5sMKFxb1b56raqGttnzDNj6q00T58l5mo189XXB2kYhpihw%3D%3D&allow_caching=true&sz=w958-h944', 'Pop', 'Festas com hits do momento.'),
('https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEVdT8lfrjgTdqzE%2BPLtSxSqoyjjQnQH72kK8ihVYB3g6BvolGs4thQT2A2Pp6uZD%2BhzcW8SdM9M0nvzaDnxQ9yL9zyGffyg%2FtevVE0nya7Z1lMRaq4RgLzTuaXUXHBjlCLRHDHRxayftFD6Jectrq214MnakzeYDCDatRM1VZ9DOp1IyTPcAMSoRW4rQckf5INQ%2FjU6kR8sG%2Fg3ekk7OhX%2FdBAlO%2B62FhqLMpKMuzs0u4dTltoWpanEDZBSyl3vBDClUqY5C44hTkKq7vHzHP0PjcIvzcjJLF9DAXefTB%2FucBF4xvCLDM045I2y0n5eD7Oupvvn%2FMIEjnjDwI%2BGpBtgzoFF%2FDFVldh1BOQQFTKVQgItFXOx0MPMGOnTRdnyHlT6sCM0h4IjfZHqIB35q33D551CCn4x%2FCwL8S%2BDpLJToXcnA0yv91%2Ff6Xrwki1ZMuMsN7Z7L49EKaEmkNh%2B6fKXoonKU%2Fl0SqTg99k%2FaswEtREkMur4jTAlxcxyaQPvC%2BbSpL%2FjhiT0q%2BA8HCLIG7XePyV6D5i8EUNoPVEpaGPlf8iv7om1gVWWqfqUh2dtcg%3D%3D&allow_caching=true&sz=w958-h944.jpg', 'Jazz', 'Eventos com musica jazz ao vivo.'),
('https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEVe54DDHTqmlEatd38IDfi3y1T0TaRZSexPW2R%2F%2BVJGl1GoFUIkibasedmrOkcqsthlTUDMXXg7rAvKVtvURRuXR3H4putY%2FHwIBI%2FusGx1rArTDx78Q9oRQ5fv1oSz9yRdDZVZz%2BtEDhbPbWtxJA2M%2Ffwj351VMuxnLPmpjyiWYE3YttBhxfTqIahPaVK2OGtT8yg2PpLRa5RM1X9jqHCD9VqVVYU7yXTlgJsQ3Zv83GpsU1TEMxDeOOkD18WS6aYvW%2Bk2f96AQZFAG4C6zb9TCXNcHBeYJCZV7%2F%2BWpGmpvdV6ICzn3NmProDDigAMvrpqP51hYmF5d17SY9ql4%2B0OLFmReCX76WLnZsKd8IKmDl8NC9EJPSNxSWKENO5wSFMt%2FhlWdTGWZOci9pad8M5ehGVYZbAkTWl%2FUUlmmbmk9OpChQLLvhOzfLIAkvz7k2duTcqZ4PsKmLIaIX7SEn521NtTtHlzFVkUxIneDH97LLokpBE7lc1BW5DJYbXasaFkVHHk89f27V4o%2FJn%2FH2C5%2F3gIsw%2BDA%2F1XmNwOI8WY44mwKv8SddsPuZVJnZks7g%3D%3D&allow_caching=true&sz=w958-h944', 'Hip-Hop', 'Festas com musica hip-hop e rap.'),
('https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEXC6aL%2FumGrli6j9swPC%2F2dUB57a%2FysQuNhbLW1gnTzJpPkCQAb3WjRos8tqGLkajmF5uwIaAf%2BhBknNvt5d5fAzNJ52qi5gbbtSNckbE%2Bvqe7Cnvz1ctjCkbdKWbNXnJ%2FQqOcnT05UIQBuDDS2%2F76FS4lkZDjMxKFyY%2FEsr4A5n2LFY023hKgjBzWHpJTzKDj3U4Ci7mMQZCq5qGH9oDxFE9sJdMKeuV9Eobd%2BVMDmtZ7OQv7P2bdcsk2PnG3xSWQibI3DBlsb8QtXqL8GV61aaOiwmMV8iCjwTiu%2FxPXanfWuMG2eRXRofxCLf%2Fj0YQZi%2BXlGDswVfQpULXJ8dn9hO84zhxkfDdf4wTy9S7q1lP6hgPB76oxNsr6r5RNVRYs6%2FolZCOCuMry5R080KX6kFaYmqTAzJq9r3Lt%2FKwA354i0xsJta53%2BLWSAjLaH8pO5EhMmEIeeyLZ1U3o%2BFQ4UHxAo%2FpAIE%2FerdwZms9TNsyl28jwmrOuPJs7IOm%2F2xv5z5jQvWFOe%2B337Yd2us0yCVLIYh4Bb%2FgoEnP7kFienejaKU4b5pEl%2Fdb0gbHMvMw%3D%3D&allow_caching=true&sz=w958-h944', 'Classica', 'Eventos com musica classica.'),
('https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEVJ93QyaE2Y5KWKtIRTKyvY%2F6QCmApqQVfjgGUsnJggOWQ%2BAVE78o2BpV4E8h7M2LElUB2S4bz5GHkD5rtVjoc%2FDRGZ8lQBw79gbftayQdSOp2iF5Icen02S8qcCNUhaTCOOiLXi%2FNZIabQbzoR9a%2Fif9k9nffGEBP6ZD72%2BmE4hUFwlJao6CKGLuRp8p0pgotejiBMsEQ5BgTjQ3vKRhQcSdxkj4ho5EdEH9CN9%2Bvx0sXvTCE9GFRah24qC%2F4qBP7hUUtuN5rxXvZgW3gEYK4JjGUW0273JnfRBUyvf%2FtlVhQjnTCK6vJz6XPzR5Vve9d4B%2BpqoJo1ENPetDy4LRHLOjS92kwQoXRHN3Z0uJwyiiMIIYc1IzEw8F%2BoPPILMhqtdCCMO%2BsQtYlcUCdGYrLnKgJbZru%2FND1fPWajDFGZkOpCOvfnLnYsT5aOEMkEn6ptUplvkw6Lm13k5W9Rq6ANAlfZg670wqD5JWtIhPPKK2GWEiMF3f8OwUNktCT4pQAGZZWnfWHTf90P8VdJYLzTHwbC04U7SXc4QXH00ZJQILVd11B0HCLtv5fgYzOr&allow_caching=true&sz=w958-h944', 'Funk', 'Festas animadas com os maiores nomes do funk.'),
('https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEXLSWVU2dsqitQn%2BWsgbjJdryvvMevHDPS5UcB6A5xJVWPZr3BS3qbbMYKuuV0Yl40H39fczCwFie186n3%2FdesdSvEaWmOHS7QNmhK7oBFclc6p06NZf1NQE1SBkf9xtC8U6S5edEUDaPMSKCXEKOPdut4wCvlJXcAcCfTcicwgy0vtVLFKBjIM3AeOZruKHn1d67iDxCeHkEMLbNtrZ26xTbj9X2hbWBBV401eu9pi8eGm5pZfN5KsCBNVXrfSyFp4r0%2BN2gst39PBe43Kq7NI5fHRdWjKdD4MVpufYdTbqy2hPxb0tuursRbR26GZPVaCgL5G5vdwfgV1e5I6LvroGM1CuBUSHCy64EVCBu1LIWzzF2dNWPmSIwCo3rZc9y7nHWUOnDLem2RXNq9Rj6xY2B2xPZIq7yaZstKSjEdX2wjmx2JMkNF5%2B9us5wZ0D8yYBCUvuheEaT25gtECXKqzlF0jkwS93ZNdxfPD0kAVI6i%2BBJt6hX%2FFYQTyfwFf2JPiCpNIaQTo1gE5OawzQxb1IbPJrXuqdpBz1bsbkmHEqxgYxQkUzRF%2FSiCbPQU%3D&allow_caching=true&sz=w958-h944', 'Sertanejo', 'Eventos com shows sertanejos e clima de interior.'),
('https://sdmntprwestus.oaiusercontent.com/files/00000000-0044-6230-949c-f887021812da/raw?se=2025-05-27T12%3A40%3A19Z&sp=r&sv=2024-08-04&sr=b&scid=673aab31-993f-5344-a8f3-28bc0ac1079c&skoid=ea0c7534-f237-4ccd-b7ea-766c4ed977ad&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2025-05-27T10%3A56%3A12Z&ske=2025-05-28T10%3A56%3A12Z&sks=b&skv=2024-08-04&sig=JewdovuKi0fXsttgHA0cwb26%2BYzo145XqJStVgNEpx4%3D', 'Reggae', 'Vibracoes positivas e muito reggae ao vivo.'),
('https://lh6.googleusercontent.com/proxy/oEP4Jaii9GNKwxRXFamD5si6FKqSphM-HPF4bXq_PUObF7AhCOd4yB8iqGpvXffmIBOHas94vF3sk1D6xjlYgeFncoPC9ke6wU9e2Y4HXBsnEs_3SEiMCtDEKtLnj9oqMldy-2-BE8uBeUBlcGVTLTNzVxWHuXtOHaJgE7NXMRnrEPKzWCj_ZBPu70wifVhK30-cT45Z3ntbZf0GgN8dLBjSduir10KxETEd90eZOzspFZYva-dDJcobzwM71ugyaOgTqXacsYay-H9iO5Ta2o7qbiwENOnH0QYjLU0b6zuumQzMZZfK8cXo9Ov0oKscnaSNLvc6yXvvRST5gM7AsPotM9ajGmsYIQ9mnRScTRt5YeZqZ77f6fTmGGstDqcEJfK5QYAoqZ9875-1xwS5VOIwpg5Z_lulbg-G_ImqHQ9ynTYGXrs2FZNCB0vD7zNYET3frLl36iqjbSh0SSSux6KoPNtv45cI2mJj05BEYB7HMQE9KXl8uD1EqK1W3GVrYsY-Wwds_qIrLaTtSbETiemeb1Zx9v-CDV4=w958-h944.jpg', 'Trap', 'Festas com beats pesados e artistas da cena trap.');

INSERT INTO users (name, username, email, senha, perfil_photo, bio) VALUES
('Maria Eduarda', 'mariaeduarda', 'maria@gmail.com', '123456', 'https://img.freepik.com/fotos-gratis/mulher-bonita-celebrando-o-conceito-de-ano-novo_23-2148722189.jpg', 'Amante de festas e eventos.'),
('Joao Silva', 'joaosilva', 'joao@gmail.com', '123456', 'https://ampliar.org.br/wp-content/uploads/2021/04/aumenta-a-procura-de-cursos-online-durante-a-pandemia.jpg', 'Organizador de eventos.'),
('Ana Paula', 'anapaula', 'ana@gmail.com', '123456', 'https://www.paraisodasfestas.com.br/wp-content/uploads/2024/05/gestao-de-eventos.jpg', 'Especialista em decoracao de festas.'),
('Carlos Mendes', 'carlosm', 'carlos@gmail.com', '123456', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgKgxiPTwU8Gn-iWoQqFRPC69O9147iukCJg', 'DJ profissional.'),
('Fernanda Lima', 'fernandal', 'fernanda@gmail.com', '123456', 'https://st4.depositphotos.com/13194036/22991/i/450/depositphotos_229919408-stock-photo-beautiful-young-woman-using-photo.jpg', 'Fotografa de eventos.'),
('Lucas Pereira', 'lucasp', 'lucas@gmail.com', '123456', 'https://lets.events/blog/wp-content/uploads/2017/05/saiba-quais-sao-as-principais-competencias-de-um-produtor-de-eventos.jpeg', 'Produtor de eventos.');

INSERT INTO events (title, place_id, attraction_id, style_id, time_start, time_end, description, event_photo, events_rules, party_itens, take_products, hashtags)
VALUES
('Sunset Prive', 1, 1, 1, '2025-06-01 18:00:00', '2025-06-01 23:59:00',
 'Evento exclusivo com DJs renomados, open bar premium e vista para o por do sol.',
 'https://example.com/sunset_prive.jpg',
 'Proibido entrar com bebidas externas. Respeitar a capacidade do local. Traje elegante.',
 'Open bar premium, DJs renomados, iluminacao especial.',
 'Bebidas alcoolicas, ingressos, brindes exclusivos.',
 '#SunsetVibes #DJSet #OpenBar #PremiumExperience'),

('Noite Branca', 2, 2, 2, '2025-06-15 22:00:00', '2025-06-16 03:00:00',
 'Uma noite all white com convidados selecionados, champagne e muita elegancia.',
 'https://example.com/noite_branca.jpg',
 'Traje branco obrigatorio. Proibido entrada de menores. Capacidade limitada.',
 'Champagne, decoracao all white, iluminacao sofisticada.',
 'Ingressos VIP, champagne premium, pulseiras de acesso.',
 '#NoiteBranca #Elegancia #AllWhiteParty #ExclusiveEvent'),

('Garden Secret', 3, 3, 3, '2025-06-20 19:00:00', '2025-06-20 23:00:00',
 'Coquetel privado em um jardim secreto, com finger foods e jazz ao vivo.',
 'https://example.com/garden_secret.jpg',
 'Evento fechado. Proibido a entrada de cameras e gravacoes. Nao sera permitido o consumo de alimentos de fora.',
 'Finger foods gourmet, decoracao rustica, jazz ao vivo.',
 'Ingressos VIP, cardapios exclusivos, coqueteis personalizados.',
 '#SecretGarden #JazzLive #PrivateEvent #GourmetExperience'),

('Vibes Select', 4, 4, 4, '2025-06-25 22:00:00', '2025-06-26 04:00:00',
 'Festa fechada com line-up especial e acesso restrito para convidados.',
 'https://example.com/vibes_select.jpg',
 'Evento exclusivo para convidados. E proibido a entrada de cameras profissionais. Traje de festa.',
 'DJs renomados, pista de danca iluminada, visual inovador.',
 'Ingressos VIP, bebidas exclusivas, catering personalizado.',
 '#VibesSelect #ExclusiveEvent #DJParty #InvitedOnly'),

('Aurora Exclusive', 5, 5, 5, '2025-07-01 05:00:00', '2025-07-01 10:00:00',
 'Sunrise party para um grupo seleto, com cafe da manha gourmet e musica chill.',
 'https://example.com/aurora_exclusive.jpg',
 'Proibido entrar com bebidas nao alcoolicas. Respeitar o horario do evento. Traje confortavel.',
 'Cafe da manha gourmet, ambiente chill, musica suave ao amanhecer.',
 'Bebidas premium, cardapio exclusivo, ingressos para o evento VIP.',
 '#AuroraExclusive #SunriseParty #ChillVibes #GourmetExperience'),

('Clube 88', 6, 6, 6, '2025-07-05 23:00:00', '2025-07-06 06:00:00',
 'Uma experiencia noturna reservada para membros e convidados VIP.',
 'https://example.com/clube_88.jpg',
 'Acesso restrito, traje elegante e sem celular. Proibido entrada de menores.',
 'Open bar, pistas de danca, shows exclusivos.',
 'Ingressos VIP, acessorios de acesso, brindes exclusivos.',
 '#Clube88 #VIPNight #ExclusiveExperience #Nightlife'),

('Circulo Dourado', 7, 7, 7, '2025-07-10 21:00:00', '2025-07-11 02:00:00',
 'Evento black-tie com gastronomia refinada e performances ao vivo.',
 'https://example.com/circulo_dourado.jpg',
 'Traje black-tie obrigatorio. Proibido uso de cameras e gravacoes.',
 'Gastronomia refinada, performances ao vivo, drinks exclusivos.',
 'Ingressos VIP, bebidas premium, cardapios personalizados.',
 '#CirculoDourado #GalaNight #BlackTie #ExclusiveEvent'),

('Rodeio de Americana', 8, 8, 8, '2025-07-12 18:00:00', '2025-07-12 23:59:00',
 'O maior rodeio do Brasil, com montarias emocionantes e shows de artistas renomados.',
 'https://example.com/rodeio_americana.jpg',
 'Proibido a entrada de bebidas alcoolicas externas. Respeitar as normas de seguranca.',
 'Montarias, shows sertanejos, barraquinhas tipicas.',
 'Ingressos, camisas comemorativas, pulseiras de acesso.',
 '#RodeioDeAmericana #ShowDeMontarias #Sertanejo #EventoPopular'),

('Gate 22', 9, 9, 9, '2025-07-15 23:30:00', '2025-07-16 06:00:00',
 'Balada exclusiva com DJs de renome, open bar e atmosfera futurista ate o amanhecer.',
 'https://example.com/gate_22.jpg',
 'Evento exclusivo, proibido o uso de celulares na pista de danca.',
 'Open bar, DJs de renome, luzes de LED, pista de danca futurista.',
 'Ingressos VIP, pulseiras de acesso, bebidas exclusivas.',
 '#Gate22 #FuturisticParty #VIPEvent #DanceAllNight'),

('Festival Tropical', 10, 10, 10, '2025-07-18 12:00:00', '2025-07-18 23:59:00',
 'Festival com ritmos latinos e musica ao vivo, ambiente descontraido e muito calor humano.',
 'https://example.com/festival_tropical.jpg',
 'Entrada proibida para menores de 18 anos. Respeitar os espacos de convivencia.',
 'Musica latina, comidas tipicas, danca ao vivo.',
 'Ingressos, pulseiras de acesso, brindes de patrocinadores.',
 '#FestivalTropical #LatinVibes #ComidaTipica #DancaAoVivo'),

('Lounge Vip', 11, 11, 10, '2025-07-20 20:00:00', '2025-07-20 02:00:00',
 'Ambiente intimista com drinks sofisticados e musica lounge, perfeito para relaxar.',
 'https://example.com/lounge_vip.jpg',
 'Proibido o uso de cameras e celulares. Respeitar o horario de encerramento.',
 'Drinks sofisticados, musica lounge, iluminacao suave.',
 'Ingressos VIP, drinks exclusivos, cardapios de degustacao.',
 '#LoungeVip #ChillVibes #ExclusiveEvent #LoungeMusic'),

('Underwater Party', 12, 12, 10, '2025-07-22 22:00:00', '2025-07-23 04:00:00',
 'Festa tematica subaquatica com DJs ao vivo e luzes incriveis em um cenario surreal.',
 'https://example.com/underwater_party.jpg',
 'Proibido usar roupas de banho fora da pista de danca. Apenas roupas apropriadas para o evento.',
 'Festa subaquatica, DJs de renome, luzes de neon e projecoes surreais.',
 'Ingressos VIP, pulseiras, brindes e bebidas tematicas.',
 '#UnderwaterParty #NeonLights #SurrealExperience #DanceUnderwater'),

('Masquerade Ball', 13, 13, 1, '2025-07-24 21:00:00', '2025-07-25 03:00:00',
 'Baile de mascaras elegante com traje formal e um toque de misterio.',
 'https://example.com/masquerade_ball.jpg',
 'Traje formal e mascara obrigatoria. Proibido gravar videos durante o evento.',
 'Baile de mascaras, decoracao luxuosa, performances ao vivo.',
 'Ingressos VIP, mascaras personalizadas, drinks exclusivos.',
 '#MasqueradeBall #MasqueradeParty #Elegance #Mystery'),

('Rooftop Experience', 14, 14, 2, '2025-07-26 18:00:00', '2025-07-26 23:59:00',
 'Festa exclusiva no topo do predio com uma vista deslumbrante da cidade e muita musica eletronica.',
 'https://example.com/rooftop_experience.jpg',
 'Proibido entrada de cameras profissionais. Respeitar o horario de encerramento.',
 'DJ ao vivo, vista panoramica, open bar.',
 'Ingressos VIP, drinks premium, pulseiras de acesso.',
 '#RooftopParty #CityView #ElectronicVibes #ExclusiveEvent'),

('Jungle Escape', 15, 15, 3, '2025-08-01 20:00:00', '2025-08-02 03:00:00',
 'Festa no meio da natureza, com tematica de jungle e DJs trazendo o melhor do house e techno.',
 'https://example.com/jungle_escape.jpg',
 'Proibido o uso de celulares na pista de danca. Traje confortavel e adequado ao ambiente.',
 'Jungle theme, DJs de house e techno, decoracao imersiva.',
 'Ingressos, pulseiras de acesso, brindes exclusivos.',
 '#JungleEscape #TechnoVibes #HouseMusic #JungleTheme'),

('Secret Garden', 16, 16, 4, '2025-08-05 19:00:00', '2025-08-05 23:59:00',
 'Evento secreto em um jardim encantado com musica ao vivo e gastronomia sofisticada.',
 'https://example.com/secret_garden.jpg',
 'Evento fechado, somente convidados. Nao sera permitida a entrada com celulares.',
 'Gastronomia refinada, apresentacoes ao vivo, ambiente secreto.',
 'Ingressos VIP, catering personalizado, brindes exclusivos.',
 '#SecretGarden #LiveMusic #GourmetExperience #ExclusiveEvent'),

('Neon Lights', 17, 17, 5, '2025-08-10 22:00:00', '2025-08-11 04:00:00',
 'Festa com luzes neon, arte interativa e musica para dancar ate amanhecer.',
 'https://example.com/neon_lights.jpg',
 'Proibido o uso de celulares na pista de danca. Respeitar o horario do evento.',
 'Luzes neon, arte interativa, DJs ao vivo.',
 'Ingressos VIP, pulseiras de acesso, drinks neon.',
 '#NeonLights #DanceAllNight #NeonVibes #InteractiveArt'),

('Glamour Night', 18, 18, 6, '2025-08-15 21:00:00', '2025-08-16 02:00:00',
 'Noite glamourosa com tapete vermelho, moda e shows de artistas internacionais.',
 'https://example.com/glamour_night.jpg',
 'Traje formal e sapatos elegantes. Proibido a entrada de menores de 18 anos.',
 'Tapete vermelho, moda, shows internacionais.',
 'Ingressos VIP, tapete vermelho, brindes de patrocinadores.',
 '#GlamourNight #RedCarpet #FashionShow #ExclusiveEvent'),

('Cosmic Journey', 19, 19, 7, '2025-08-20 22:00:00', '2025-08-21 05:00:00',
 'Evento futurista com decoracao cosmica, DJs e uma imersao sonora de tirar o folego.',
 'https://example.com/cosmic_journey.jpg',
 'Proibido o uso de celulares durante a performance. Traje futurista recomendado.',
 'Decoracao cosmica, musica eletronica, iluminacao imersiva.',
 'Ingressos VIP, pulseiras de acesso, brindes cosmicos.',
 '#CosmicJourney #FuturisticEvent #CosmicVibes #ElectronicMusic'),

('Carnaval Prive', 20, 20, 8, '2025-08-25 20:00:00', '2025-08-26 03:00:00',
 'Festa de carnaval exclusiva com desfiles e shows de samba ao vivo.',
 'https://example.com/carnaval_prive.jpg',
 'Traje de carnaval obrigatorio. Proibido o uso de cameras profissionais.',
 'Desfiles de carnaval, samba ao vivo, bebidas tropicais.',
 'Ingressos VIP, fantasias exclusivas, pulseiras de acesso.',
 '#CarnavalPrive #Samba #ExclusiveEvent #BrazilianParty');

INSERT INTO posts (user_id, event_id, image_post, content, data_postagem)
VALUES
(1, 1, 'maria_festa.jpg', 'A melhor festa da praia!', '2025-06-22'),
(2, 2, 'joao_festival.jpg', 'Festival de rock incrivel!', '2025-07-20'),
(3, 3, 'ana_noite.jpg', 'Noite eletronica perfeita!', '2025-08-10'),
(4, 4, 'carlos_jazz.jpg', 'Jazz ao por do sol e tudo!', '2025-09-05'),
(5, 5, 'fernanda_karaoke.jpg', 'Karaoke night foi demais!', '2025-10-12'),
(6, 6, 'lucas_cobertura.jpg', 'Festa na cobertura com vista incrivel!', '2025-11-18'),
(1, 7, 'maria_rooftop.jpg', 'Vista incrivel no rooftop!', '2025-12-01'),
(2, 8, 'joao_rodeio.jpg', 'Rodeio de Americana foi epico!', '2025-12-05'),
(3, 9, 'ana_neon.jpg', 'Luzes neon incriveis!', '2025-12-10'),
(4, 10, 'carlos_tropical.jpg', 'Festival tropical cheio de energia!', '2025-12-15'),
(5, 11, 'fernanda_lounge.jpg', 'Ambiente perfeito no lounge VIP.', '2025-12-20'),
(6, 12, 'lucas_underwater.jpg', 'Festa subaquatica surreal!', '2025-12-25'),
(1, 13, 'maria_masquerade.jpg', 'Baile de mascaras elegante!', '2026-01-01'),
(2, 14, 'joao_rooftop.jpg', 'Festa no topo da cidade!', '2026-01-05'),
(3, 15, 'ana_jungle.jpg', 'Festa na selva foi incrivel!', '2026-01-10'),
(4, 16, 'carlos_secret.jpg', 'Evento secreto inesquecivel!', '2026-01-15'),
(5, 17, 'fernanda_neon.jpg', 'Luzes neon e muita musica!', '2026-01-20'),
(6, 18, 'lucas_glamour.jpg', 'Noite glamourosa com estilo!', '2026-01-25'),
(1, 19, 'maria_cosmic.jpg', 'Viagem cosmica incrivel!', '2026-01-30'),
(2, 20, 'joao_carnaval.jpg', 'Carnaval Prive foi sensacional!', '2026-02-05');

INSERT INTO integrantes (photo_integrante, name, funcao_equipe)
VALUES 
('giovanna.png', 'Giovanna Alba', 'Product Owner'),
('maria.png', 'Maria Eduarda Parma', 'Scrum Master'),
('enzo.png', 'Enzo Turcovic', 'Desenvolvedor'),
('kevin.png', 'Kevin Eziquiel', 'Desenvolvedor'),
('lucas.png', 'Lucas Zani', 'Desenvolvedor'),
('luiz.png', 'Luiz Henrique Aureliano', 'Desenvolvedor');