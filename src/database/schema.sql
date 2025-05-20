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
    event_photo TEXT,
    events_rules TEXT,
    party_itens TEXT,
    take_products TEXT,
    hashtags VARCHAR(50)
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
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE SET NULL,
    event_id INTEGER NOT NULL REFERENCES events(id) ON DELETE SET NULL,
    image_post TEXT NOT NULL,
    content VARCHAR(300) NOT NULL,
    data_postagem DATE DEFAULT CURRENT_DATE
);

CREATE TABLE integrantes (
    id SERIAL PRIMARY KEY,
    photo_integrante TEXT,
    name VARCHAR(255) NOT NULL,
    funcao_equipe VARCHAR(255) NOT NULL
);

/* inserts */

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
('Gate 22', 'Balada exclusiva com DJs de renome, open bar e atmosfera futurista até o amanhecer.', 'https://api.wegoout.com.br/wp-uploads/wp-images/2023/05/gate22_2.jpg'),
('Festival Tropical', 'Festival com ritmos latinos e música ao vivo, ambiente descontraído e muito calor humano.', 'https://festival_tropical.jpg'),
('Lounge Vip', 'Ambiente intimista com drinks sofisticados e música lounge, perfeito para relaxar.', 'https://lounge_vip.jpg'),
('Underwater Party', 'Festa temática subaquática com DJs ao vivo e luzes incríveis em um cenário surreal.', 'https:///underwater_party.jpg'),
('Masquerade Ball', 'Baile de máscaras elegante com traje formal e um toque de mistério.', 'https://masquerade_ball.jpg'),
('Rooftop Experience', 'Festa exclusiva no topo do prédio com uma vista deslumbrante da cidade e muita música eletrônica.', 'https://rooftop_experience.jpg'),
('Jungle Escape', 'Festa no meio da natureza, com temática de jungle e DJs trazendo o melhor do house e techno.', 'https://jungle_escape.jpg'),
('Secret Garden', 'Evento secreto em um jardim encantado com música ao vivo e gastronomia sofisticada.', 'https://secret_garden.jpg'),
('Neon Lights', 'Festa com luzes neon, arte interativa e música para dançar até amanhecer.', 'https://neon_lights.jpg'),
('Glamour Night', 'Noite glamourosa com tapete vermelho, moda e shows de artistas internacionais.', 'https://glamour_night.jpg'),
('Cosmic Journey', 'Evento futurista com decoração cósmica, DJs e uma imersão sonora de tirar o fôlego.', 'https://cosmic_journey.jpg'),
('Carnaval Privé', 'Festa de carnaval exclusiva com desfiles e shows de samba ao vivo.', 'https://carnaval_prive.jpg'),
('Summer Vibes', 'Festa tropical com drinks exóticos, pista de dança ao ar livre e muita energia.', 'https://summer_vibes.jpg'),
('Black & Gold', 'Evento sofisticado com dress code black & gold e performances de artistas internacionais.', 'https://black_and_gold.jpg'),
('Gatsby Night', 'Noite inspirada nos anos 20 com glamour, jazz ao vivo e muito champagne.', 'https://gatsby_night.jpg'),
('Sunset Beats', 'Festa ao pôr do sol com DJs de música eletrônica e uma vista incrível do mar.', 'https://sunset_beats.jpg'),
('Masquerade in Venice', 'Baile de máscaras veneziano com música clássica, elegante e misteriosa.', 'https://masquerade_venice.jpg'),
('Winter Wonderland', 'Evento invernal com decoração temática e festas quentes ao redor da lareira.', 'https://winter_wonderland.jpg'),
('Tropical Luau', 'Festa havaiana com muito limbo, coquetéis tropicais e show de dança polinésia.', 'https://tropical_luau.jpg'),
('Techno Tribe', 'Festa underground com DJs de techno e arte visual futurista.', 'https://techno_tribe.jpg'),
('Electric Dreams', 'Evento de música eletrônica com performances visuais e artistas de renome mundial.', 'https://electric_dreams.jpg'),
('Neon Party', 'Festa vibrante com luzes neon, música eletrônica e visual imersivo.', 'https://neon_party.jpg'),
('Vintage Night', 'Uma noite retrô com música dos anos 80 e 90, com muito charme e estilo.', 'https://vintage_night.jpg'),
('Glow in the Dark', 'Evento iluminado por luzes UV, com pista de dança e drinks fluorescentes.', 'https://glow_in_the_dark.jpg'),
('Sahara Experience', 'Festa temática no deserto com decoração exótica e música árabe moderna.', 'https://www.example.com/sahara_experience.jpg'),
('Moonlight Gala', 'Baile de gala ao ar livre com vista para a lua e uma atmosfera encantadora.', 'https://www.example.com/moonlight_gala.jpg'),
('Festa das Estrelas', 'Celebração estrelada com DJs, luzes cintilantes e muito brilho.', 'https://www.example.com/festa_das_estrelas.jpg'),
('Miami Nights', 'Festa no estilo de Miami com muita música latina, drinks e energia contagiante.', 'https://www.example.com/miami_nights.jpg'),
('Cirque du Soleil Party', 'Festa temática inspirada no Cirque du Soleil, com performances de circo e arte.', 'https://www.example.com/cirque_du_soleil_party.jpg'),
('Secret Masquerade', 'Evento secreto com tema de baile de máscaras e glamour.', 'https://www.example.com/secret_masquerade.jpg'),
('Fiesta Latina', 'Festa com ritmos latinos, danças típicas e uma atmosfera vibrante.', 'https://www.example.com/fiesta_latina.jpg'),
('Retro Wave', 'Festa com temática dos anos 80 e 90, com música retro e muita nostalgia.', 'https://www.example.com/retro_wave.jpg'),
('Fiesta do Sol', 'Festa ao ar livre com temática tropical, drinks refrescantes e muita música.', 'https://www.example.com/fiesta_do_sol.jpg'),
('La Noche Española', 'Noite espanhola com flamenco, tapas e uma atmosfera vibrante.', 'https://www.example.com/la_noche_espagnola.jpg'),
('Cosmic Odyssey', 'Festa futurista com tema espacial, luzes e DJs de música eletrônica.', 'https://www.example.com/cosmic_odyssey.jpg'),
('Tropical Storm', 'Festa com temática tropical e mistura de ritmos latino e eletrônico.', 'https://www.example.com/tropical_storm.jpg'),
('Lunar Eclipse', 'Evento exclusivo durante a lua cheia, com uma vibe mística e shows ao vivo.', 'https://www.example.com/lunar_eclipse.jpg'),
('Hollywood Glam', 'Noite de glamour inspirada no estilo Hollywood, com tapete vermelho e coquetéis sofisticados.', 'https://www.example.com/hollywood_glam.jpg'),
('Hawaiian Breeze', 'Festa temática havaiana com danças típicas, coquetéis tropicais e muita energia.', 'https://www.example.com/hawaiian_breeze.jpg'),
('Winter Fiesta', 'Festa de inverno com música quente e atmosfera aconchegante ao redor da lareira.', 'https://www.example.com/winter_fiesta.jpg'),
('Renaissance Ball', 'Baile de máscaras com temática renascentista e performances artísticas.', 'https://www.example.com/renaissance_ball.jpg'),
('Blackout Party', 'Evento no escuro com luzes neon e música eletrônica, uma experiência única.', 'https://www.example.com/blackout_party.jpg'),
('Sunset Bliss', 'Festa ao pôr do sol com DJs relaxantes, drinks sofisticados e uma vibe zen.', 'https://www.example.com/sunset_bliss.jpg');


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

INSERT INTO styles (style_photo, name, description)
VALUES 
('electronic.jpg', 'Eletrônica', 'Festas com música eletrônica.'),
('rock.jpg', 'Rock', 'Eventos com bandas de rock ao vivo.'),
('pop.jpg', 'Pop', 'Festas com hits do momento.'),
('jazz.jpg', 'Jazz', 'Eventos com música jazz ao vivo.'),
('hiphop.jpg', 'Hip-Hop', 'Festas com música hip-hop e rap.'),
('classical.jpg', 'Clássica', 'Eventos com música clássica.'),
('funk.jpg', 'Funk', 'Festas animadas com os maiores nomes do funk.'),
('sertanejo.jpg', 'Sertanejo', 'Eventos com shows sertanejos e clima de interior.'),
('reggae.jpg', 'Reggae', 'Vibrações positivas e muito reggae ao vivo.'),
('trap.jpg', 'Trap', 'Festas com beats pesados e artistas da cena trap.');

INSERT INTO users (name, username, email, perfil_photo, bio)
VALUES 
('Maria Eduarda', 'mariaeduarda', 'maria@example.com', 'maria.jpg', 'Amante de festas e eventos.'),
('João Silva', 'joaosilva', 'joao@example.com', 'joao.jpg', 'Organizador de eventos.'),
('Ana Paula', 'anapaula', 'ana@example.com', 'ana.jpg', 'Especialista em decoração de festas.'),
('Carlos Mendes', 'carlosm', 'carlos@example.com', 'carlos.jpg', 'DJ profissional.'),
('Fernanda Lima', 'fernandal', 'fernanda@example.com', 'fernanda.jpg', 'Fotógrafa de eventos.'),
('Lucas Pereira', 'lucasp', 'lucas@example.com', 'lucas.jpg', 'Produtor de eventos.');
  

INSERT INTO events (title, localization, date, time_start, time_end, description, event_photo)
VALUES 
('Praia da vila', 'Praia da vila', '2025-06-22', '15:00', '23:00', 'Uma festa inesquecível na praia.', 'festapraia.jpg'),
('Festival de Rock', 'Mountain Resort', '2025-07-20', '14:00', '22:00', 'Festival com as melhores bandas de rock.', 'festivalrock.jpg'),
('Noite Eletrônica', 'Night Club', '2025-08-10', '22:00', '04:00', 'Balada com os melhores DJs.', 'noiteeletronica.jpg'),
('Jazz ao Pôr do Sol', 'Garden Party', '2025-09-05', '17:00', '20:00', 'Evento relaxante com música jazz.', 'jazzpordosol.jpg'),
('Karaokê Night', 'City Hall', '2025-10-12', '19:00', '23:00', 'Noite divertida de karaokê.', 'karaokenight.jpg'),
('Festa na Cobertura', 'Rooftop Lounge', '2025-11-18', '20:00', '02:00', 'Festa com vista panorâmica.', 'festacobertura.jpg');


INSERT INTO posts (user_id, event_id, image_post, content, data_postagem)
VALUES 
(1, 1, 'maria_festa.jpg', 'A melhor festa da praia!', '2025-06-22'),
(2, 2, 'joao_festival.jpg', 'Festival de rock incrível!', '2025-07-20'),
(3, 3, 'ana_noite.jpg', 'Noite eletrônica perfeita!', '2025-08-10'),
(4, 4, 'carlos_jazz.jpg', 'Jazz ao pôr do sol é tudo!', '2025-09-05'),
(5, 5, 'fernanda_karaoke.jpg', 'Karaokê night foi demais!', '2025-10-12'),
(6, 6, 'lucas_cobertura.jpg', 'Festa na cobertura com vista incrível!', '2025-11-18');

INSERT INTO integrantes (photo_integrante, name, funcao_equipe)
VALUES 
('giovanna.png', 'Giovanna Alba', 'Product Owner'),
('maria.png', 'Maria Eduarda', 'Scrum Master'),
('enzo.png', 'Enzo Turcovic', 'Desenvolvedor'),
