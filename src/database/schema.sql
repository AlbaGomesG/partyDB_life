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
    place_id INTEGER REFERENCES places(id) ON DELETE SET NULL,
    attraction_id INTEGER REFERENCES attractions(id) ON DELETE SET NULL,
    style_id INTEGER REFERENCES styles(id) ON DELETE SET NULL,
    time_start TIMESTAMP,
    time_end TIMESTAMP,
    description TEXT,
    event_photo TEXT,
    events_rules TEXT,
    party_itens TEXT,
    take_products TEXT,
    hashtags TEXT
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
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    event_id INTEGER REFERENCES events(id) ON DELETE CASCADE,
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
('https://example.com/billie_eilish.jpg', 'Billie Eilish', 'Show de pop e eletronico com uma performance unica e energetica.'),
('https://example.com/anitta.jpg', 'Anitta', 'Performance de pop brasileiro com uma mistura de funk e R&B.'),
('https://example.com/ed_sheeran.jpg', 'Ed Sheeran', 'Show de pop e musica acustica, com grandes sucessos e emocoes no palco.'),
('https://example.com/alok.jpg', 'Alok', 'DJ mundialmente renomado com uma performance de musica eletronica.'),
('https://example.com/hariel.jpg', 'Hariel', 'Performance de rap e trap com letras intensas e um show de energia.'),
('https://example.com/anavitoria.jpg', 'Anavitoria', 'Show de pop romantico e intimista ao ar livre, trazendo boas vibracoes.'),
('https://example.com/travis_scott.jpg', 'Travis Scott', 'Rap e trap com batidas pesadas, trazendo uma vibe futurista e intensa.'),
('https://example.com/ivete_sangalo.jpg', 'Ivete Sangalo', 'Show de axe, com muito ritmo e energia, para todos dancarem ate amanhecer.'),
('https://example.com/jorge_mateus.jpg', 'Jorge & Mateus', 'Sertanejo universitario com grandes sucessos que marcaram geracoes.'),
('https://example.com/marilia_mendonca.jpg', 'Marilia Mendonca', 'Show de sertanejo com letras emocionantes e hits da atualidade.'),
('https://example.com/dua_lipa.jpg', 'Dua Lipa', 'Performance de pop internacional com coreografias e hits globais.'),
('https://example.com/justin_bieber.jpg', 'Justin Bieber', 'Show de pop e R&B com sucessos que marcaram epocas.'),
('https://example.com/metallica.jpg', 'Metallica', 'Banda de rock com um show eletrizante e classicos do heavy metal.'),
('https://example.com/beyonce.jpg', 'Beyonce', 'Performance de R&B e pop com coreografias e uma presenca de palco unica.'),
('https://example.com/avicii.jpg', 'Avicii', 'Tributo ao DJ Avicii com seus maiores sucessos de musica eletronica.'),
('https://example.com/rihanna.jpg', 'Rihanna', 'Show de pop e R&B com hits que marcaram geracoes.'),
('https://example.com/coldplay.jpg', 'Coldplay', 'Banda de rock alternativo com um show cheio de emocao e luzes.'),
('https://example.com/katy_perry.jpg', 'Katy Perry', 'Performance de pop com figurinos coloridos e hits animados.'),
('https://example.com/drake.jpg', 'Drake', 'Show de rap e R&B com sucessos globais e uma vibe unica.'),
('https://example.com/the_weeknd.jpg', 'The Weeknd', 'Performance de R&B e pop com uma atmosfera misteriosa e hits globais.');

INSERT INTO styles (styles_photo, name, description) VALUES
('electronic.jpg', 'Eletronica', 'Festas com musica eletronica.'),
('rock.jpg', 'Rock', 'Eventos com bandas de rock ao vivo.'),
('pop.jpg', 'Pop', 'Festas com hits do momento.'),
('jazz.jpg', 'Jazz', 'Eventos com musica jazz ao vivo.'),
('hiphop.jpg', 'Hip-Hop', 'Festas com musica hip-hop e rap.'),
('classical.jpg', 'Classica', 'Eventos com musica classica.'),
('funk.jpg', 'Funk', 'Festas animadas com os maiores nomes do funk.'),
('sertanejo.jpg', 'Sertanejo', 'Eventos com shows sertanejos e clima de interior.'),
('reggae.jpg', 'Reggae', 'Vibracoes positivas e muito reggae ao vivo.'),
('trap.jpg', 'Trap', 'Festas com beats pesados e artistas da cena trap.');

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