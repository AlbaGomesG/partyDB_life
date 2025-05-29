DROP DATABASE IF EXISTS partylife;
CREATE DATABASE partylife WITH ENCODING 'UTF8';

\c partylife;

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
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
    user_id INTEGER NOT NULL,
    event_id INTEGER NOT NULL,
    image_post TEXT NOT NULL,
    content VARCHAR(300) NOT NULL,
    data_postagem DATE DEFAULT CURRENT_DATE,
    CONSTRAINT fk_post_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_post_event FOREIGN KEY (event_id) REFERENCES events(id) ON DELETE CASCADE
);

INSERT INTO users (name, username, email, senha, perfil_photo, bio) VALUES
('Lucas Pereira', '@menorKabrinha', 'lucaspereira@gmail.com', '123456', 'https://lets.events/blog/wp-content/uploads/2017/05/saiba-quais-sao-as-principais-competencias-de-um-produtor-de-eventos.jpeg', 'Produtor de eventos.');
('Julia River', '@juliariver', 'juliariver@gmail.com', '123456', 'https://img.freepik.com/fotos-gratis/mulher-bonita-celebrando-o-conceito-de-ano-novo_23-2148722189.jpg', 'Amante de festas e eventos.'),
('Livia Angelotti', '@angelotti', 'liviangelotti@gmail.com', '123456', 'https://www.paraisodasfestas.com.br/wp-content/uploads/2024/05/gestao-de-eventos.jpg', 'Amante de festas e eventos.'),
('Julia Mines', '@jujumines', 'jujumines@gmail.com', '123456', 'https://i.pinimg.com/736x/d9/08/91/d90891acd96959d790807a4a9b983663.jpg', 'Amante de festas e eventos.')
('Kauã Lopez', '@xrcz', 'kaualopez@gmail.com', '123456', 'https://ampliar.org.br/wp-content/uploads/2021/04/aumenta-a-procura-de-cursos-online-durante-a-pandemia.jpg', 'Organizador de eventos.'),
('Gabriel Pereira', '@gp', 'gabrielpereira@gmail.com', '123456', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgKgxiPTwU8Gn-iWoQqFRPC69O9147iukCJg', 'DJ profissional.'),
('Caio Vieira', '@cabezinho', '123456', 'https://i.pinimg.com/736x/1e/42/2f/1e422fafeef7bd5917b07012b8831a6c.jpg', 'Produtor de Eventos.')
('Ju Santos', '@jusantos', 'juliasantos@gmail.com', '123456', 'https://st4.depositphotos.com/13194036/22991/i/450/depositphotos_229919408-stock-photo-beautiful-young-woman-using-photo.jpg', 'Amante de festas e eventos.');


INSERT INTO events (title, time_start, time_end, description, event_photo, events_rules, party_itens, take_products, hashtags)
VALUES
('Sunset Prive', '2025-06-01 18:00:00', '2025-06-01 23:59:00',
 'Evento exclusivo com DJs renomados, open bar premium e vista para o por do sol.',
 'https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEVGXnv73Kxl6wK4B3GL4H81Pce5PCwZSBm37AoM1bas77kpTBN935q1RLvx4QClHQKT6yy%2FZN6gyf0UqO3IPygIirFexQ4eHzIjO10ZseMr1a7dw1IOjOBKGe8OLXW4M4uU54tFWOJvHG%2BM8Ein7%2FaPJ9fdEfn2skt%2BdBt804TVP5jiMDsqbkBl0ldh8kCKkMZEBgGcJwGR3J73YpWqYXZF4E%2FRtj3a%2BUUW9BPb0EibM8VGe1WI3wLtLEHCYCvIObWLE68yQ0Q1EwI2BUSoUyLzr9Jo1Sl9TjCjpSAfBmQkJIEpjP2000rDHqqBsMpfatMzba%2BaVWQTDtQ3pOIwo33c7MbHhuyWkY9sHhe1nOsNJF%2BbVArWZgJamoR%2FA52%2FgRhyxYyQtwVRCUMUnio%2BjEoUaK6w%2BTDPDbntXAJsVtQ9URmNQkIHsNQUUGUQNrh2QrU1Q7KrAsdXTL6mASkF7lrBtkaQOVultGVIDV%2Fp5oWXdTTXIdiPzCyq2GFlkSRNK3Fwv2t6NbJvuhBnwBeDFGnLn4pWbHxpP1nWP0E2dTysRIMHftNQer7XPxnwUQeF&allow_caching=true&sz=w512-k',
 'Proibido entrar com bebidas externas. Respeitar a capacidade do local. Traje elegante.',
 'Open bar premium, DJs renomados, iluminacao especial.',
 'Bebidas alcoolicas, ingressos, brindes exclusivos.',
 '#SunsetVibes #DJSet #OpenBar #PremiumExperience'),

('Noite Branca', '2025-06-15 22:00:00', '2025-06-16 03:00:00',
 'Uma noite all white com convidados selecionados, champagne e muita elegancia.',
 'https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEX32MPbv2QSEMPyRVNIXRnve%2FA%2FJQy9C98F17bSzAjPklmhxlbeVZ6xMTSR%2FcDjjv8IWXajEqT1kdZPYKRiFWubThf6bG7RkOln4TcvaKsFBxKqNMzjXm4OPwsREt%2Br3HDg%2B8Ei5gPyeDwtkfjZmAeMCuuH2hg5b0WC92lLsCcyO%2F7KAqLKr%2FDi6epyW1HnL4JnilDmB4iIiU61R9TYDz8H3eXQ4AXw%2FEyEHN9bwaY%2F7ErRd7oCAs3dL%2BF6bsMvx5qwZ%2F5WhkO1bvUWqSNetl5UL82c%2F6aFeAFib8GidLKwXtxOjB8cYf3aHO9LYY6gSC8SdXdmck3ANYfT7PAzJcUMzD%2FxprWV9JE0kSGidXqrNDkqFBuLyF88Z%2FAUN1xlY8PhKJBk4Ryr6wDy%2FS4OX0pYdzcDSr7lMfWoVSnI0KPjP1ROwpwQNqQct9NXF4KSIuTUBslZqhiVgCfE36zIAzg9m8QKLvdOLwUOi4wnv78Dy7LkR8ht%2BD9GMeOLhBz38cC8xdpYmA%2FVgPhC3NfuwdAhX1N0d6VFjTgJBE3vtuSZEAUzQqe8W7moZ7ykhAM%3D&allow_caching=true&sz=w1920-h945',
 'Traje branco obrigatorio. Proibido entrada de menores. Capacidade limitada.',
 'Champagne, decoracao all white, iluminacao sofisticada.',
 'Ingressos VIP, champagne premium, pulseiras de acesso.',
 '#NoiteBranca #Elegancia #AllWhiteParty #ExclusiveEvent'),

('Garden Secret', '2025-06-20 19:00:00', '2025-06-20 23:00:00',
 'Coquetel privado em um jardim secreto, com finger foods e jazz ao vivo.',
 'https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEXO0u%2FTSK6Y1iHCvQ0z%2FDlMy1ouzH6XXRz72kbC1eNOimn0SR%2FaaMnysv4jvBqeOTFl9COD8HQlFblgRFLrTYQL1ZOV5IFM0jwmmrKk%2B3QZ2QCn623caORDyphgqtN65I1wjcqJLmOSoxMtWvUF5Z80u%2F0%2Bxo38fWcqEBHb2%2BAKjJ3WKcKxtsq%2BRy3RTv2mXymXg2t3pWpKyLku1Z2nCWPUaM75U1HhtpGW49sgMngXUI8%2FYCmJ57m7qca4Gpfj5AXS8ZttaHzCZlPnFxlwhabiMZYkKKlWVKn%2FHbYVTZySz%2FgV8bM8bVjMbiAgwNYMnDyZBne1vcX7rUb1NCHxDr5RL9BzTW3gn6UTZ8OhA2dKvFNX2nutQY7RyY6uSnze7E1iUyjzxtyA8jfx2a2d3Y6cmGUuokyIZ9d2Jxr7eONxT%2BgjSH713AnkWN3ClKmrvCn9Zll0sBFErFUCrMM9rApoPaVCUcBKNcF%2F3ri8bv1WnVQrawEWlJgoPyZvZDCNMtl8YK79RG2M5CDS7U5cZiy%2FrljTx9E35QATuLjw6%2Baupk1jk758V08JUBCHk4DA&allow_caching=true&sz=w1920-h945',
 'Evento fechado. Proibido a entrada de cameras e gravacoes. Nao sera permitido o consumo de alimentos de fora.',
 'Finger foods gourmet, decoracao rustica, jazz ao vivo.',
 'Ingressos VIP, cardapios exclusivos, coqueteis personalizados.',
 '#SecretGarden #JazzLive #PrivateEvent #GourmetExperience'),

('Vibes Select', '2025-06-25 22:00:00', '2025-06-26 04:00:00',
 'Festa fechada com line-up especial e acesso restrito para convidados.',
 'https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEVKb4tF33VPMiODQsp1pMBd%2FRHHho4QTnUEYlRBdHYQKATXp2ndl6qE2K%2Fd2UwTcLuE0ufXothJAlTFLsf8yr7DEIaQWhX3v1L4Wi%2FFMGZ5vdwDrJSl2gjLczhCtrIahDHkfxJ2B4EX469eTqoi%2BP9fB5tx83ixzKVpQDmDRfP1XFodgB6zaFaGXdS%2BP17r1YTyXZF8jwYM4618ZiXaGZvUjbApaDZXeRP4uRRBfW4wUHqhxF38eBuW%2B%2FmRLg8%2Fwcsv3iPrTFxOulWVwaGbWtEb2ZIOGX9pqlimsxhAobxTEImg9X3Jk5hX9D4AMUGe0ui0XYA3Y0Brxctcl5FufgFMoibQux7bwtGqlz8OFoYRC%2BOrOhM5yTTt%2BetQlKdqH6MylmmNSuoQHLHGCdGvG9OJrZ5DUBRcKEwjEd7%2BG%2Br3vjx9OE%2Fo1LQ7K3aEScmMd2mqjsGEY4qZFO3KMeoGVOHEvJ7vLcSUUDmS72stGSPmdh0x6G1QozbpOF8cJj9XoyNARc0yIkFAlko5KiY%2B2Zk%2Fj%2FhYvaZeomIdo4wj3duaXr8n0EQrX9oKT7WLqoM%3D&allow_caching=true&sz=w512-k',
 'Evento exclusivo para convidados. E proibido a entrada de cameras profissionais. Traje de festa.',
 'DJs renomados, pista de danca iluminada, visual inovador.',
 'Ingressos VIP, bebidas exclusivas, catering personalizado.',
 '#VibesSelect #ExclusiveEvent #DJParty #InvitedOnly'),

('Aurora Exclusive', '2025-07-01 05:00:00', '2025-07-01 10:00:00',
 'Sunrise party para um grupo seleto, com cafe da manha gourmet e musica chill.',
 'https://example.com/aurora_exclusive.jpg',
 'Proibido entrar com bebidas nao alcoolicas. Respeitar o horario do evento. Traje confortavel.',
 'Cafe da manha gourmet, ambiente chill, musica suave ao amanhecer.',,
 'Bebidas premium, cardapio exclusivo, ingressos para o evento VIP.',
 '#AuroraExclusive #SunriseParty #ChillVibes #GourmetExperience'),

('Clube 88','2025-07-05 23:00:00', '2025-07-06 06:00:00',
 'Uma experiencia noturna reservada para membros e convidados VIP.',
 'https://example.com/clube_88.jpg',
 'Acesso restrito, traje elegante e sem celular. Proibido entrada de menores.',
 'Open bar, pistas de danca, shows exclusivos.',
 'Ingressos VIP, acessorios de acesso, brindes exclusivos.',
 '#Clube88 #VIPNight #ExclusiveExperience #Nightlife'),

('Circulo Dourado', '2025-07-10 21:00:00', '2025-07-11 02:00:00',
 'Evento black-tie com gastronomia refinada e performances ao vivo.',
 'https://example.com/circulo_dourado.jpg',
 'Traje black-tie obrigatorio. Proibido uso de cameras e gravacoes.',
 'Gastronomia refinada, performances ao vivo, drinks exclusivos.',
 'Ingressos VIP, bebidas premium, cardapios personalizados.',
 '#CirculoDourado #GalaNight #BlackTie #ExclusiveEvent'),

('Rodeio de Americana', '2025-07-12 18:00:00', '2025-07-12 23:59:00',
 'O maior rodeio do Brasil, com montarias emocionantes e shows de artistas renomados.',
 'https://example.com/rodeio_americana.jpg',
 'Proibido a entrada de bebidas alcoolicas externas. Respeitar as normas de seguranca.',
 'Montarias, shows sertanejos, barraquinhas tipicas.',
 'Ingressos, camisas comemorativas, pulseiras de acesso.',
 '#RodeioDeAmericana #ShowDeMontarias #Sertanejo #EventoPopular'),

('Gate 22', '2025-07-15 23:30:00', '2025-07-16 06:00:00',
 'Balada exclusiva com DJs de renome, open bar e atmosfera futurista ate o amanhecer.',
 'https://example.com/gate_22.jpg',
 'Evento exclusivo, proibido o uso de celulares na pista de danca.',
 'Open bar, DJs de renome, luzes de LED, pista de danca futurista.',
 'Ingressos VIP, pulseiras de acesso, bebidas exclusivas.',
 '#Gate22 #FuturisticParty #VIPEvent #DanceAllNight'),

('Festival Tropical', '2025-07-18 12:00:00', '2025-07-18 23:59:00',
 'Festival com ritmos latinos e musica ao vivo, ambiente descontraido e muito calor humano.',
 'https://example.com/festival_tropical.jpg',
 'Entrada proibida para menores de 18 anos. Respeitar os espacos de convivencia.',
 'Musica latina, comidas tipicas, danca ao vivo.',
 'Ingressos, pulseiras de acesso, brindes de patrocinadores.',
 '#FestivalTropical #LatinVibes #ComidaTipica #DancaAoVivo'),

('Lounge Vip', '2025-07-20 20:00:00', '2025-07-20 02:00:00',
 'Ambiente intimista com drinks sofisticados e musica lounge, perfeito para relaxar.',
 'https://example.com/lounge_vip.jpg',
 'Proibido o uso de cameras e celulares. Respeitar o horario de encerramento.',
 'Drinks sofisticados, musica lounge, iluminacao suave.',
 'Ingressos VIP, drinks exclusivos, cardapios de degustacao.',
 '#LoungeVip #ChillVibes #ExclusiveEvent #LoungeMusic'),

('Underwater Party', '2025-07-22 22:00:00', '2025-07-23 04:00:00',
 'Festa tematica subaquatica com DJs ao vivo e luzes incriveis em um cenario surreal.',
 'https://example.com/underwater_party.jpg',
 'Proibido usar roupas de banho fora da pista de danca. Apenas roupas apropriadas para o evento.',
 'Festa subaquatica, DJs de renome, luzes de neon e projecoes surreais.',
 'Ingressos VIP, pulseiras, brindes e bebidas tematicas.',
 '#UnderwaterParty #NeonLights #SurrealExperience #DanceUnderwater'),

('Masquerade Ball', '2025-07-24 21:00:00', '2025-07-25 03:00:00',
 'Baile de mascaras elegante com traje formal e um toque de misterio.',
 'https://example.com/masquerade_ball.jpg',
 'Traje formal e mascara obrigatoria. Proibido gravar videos durante o evento.',
 'Baile de mascaras, decoracao luxuosa, performances ao vivo.',
 'Ingressos VIP, mascaras personalizadas, drinks exclusivos.',
 '#MasqueradeBall #MasqueradeParty #Elegance #Mystery'),

('Rooftop Experience', '2025-07-26 18:00:00', '2025-07-26 23:59:00',
 'Festa exclusiva no topo do predio com uma vista deslumbrante da cidade e muita musica eletronica.',
 'https://example.com/rooftop_experience.jpg',
 'Proibido entrada de cameras profissionais. Respeitar o horario de encerramento.',
 'DJ ao vivo, vista panoramica, open bar.',
 'Ingressos VIP, drinks premium, pulseiras de acesso.',
 '#RooftopParty #CityView #ElectronicVibes #ExclusiveEvent'),

('Jungle Escape', '2025-08-01 20:00:00', '2025-08-02 03:00:00',
 'Festa no meio da natureza, com tematica de jungle e DJs trazendo o melhor do house e techno.',
 'https://example.com/jungle_escape.jpg',
 'Proibido o uso de celulares na pista de danca. Traje confortavel e adequado ao ambiente.',
 'Jungle theme, DJs de house e techno, decoracao imersiva.',
 'Ingressos, pulseiras de acesso, brindes exclusivos.',
 '#JungleEscape #TechnoVibes #HouseMusic #JungleTheme'),

('Secret Garden', '2025-08-05 19:00:00', '2025-08-05 23:59:00',
 'Evento secreto em um jardim encantado com musica ao vivo e gastronomia sofisticada.',
 'https://example.com/secret_garden.jpg',
 'Evento fechado, somente convidados. Nao sera permitida a entrada com celulares.',
 'Gastronomia refinada, apresentacoes ao vivo, ambiente secreto.',
 'Ingressos VIP, catering personalizado, brindes exclusivos.',
 '#SecretGarden #LiveMusic #GourmetExperience #ExclusiveEvent'),

('Neon Lights', '2025-08-10 22:00:00', '2025-08-11 04:00:00',
 'Festa com luzes neon, arte interativa e musica para dancar ate amanhecer.',
 'https://example.com/neon_lights.jpg',
 'Proibido o uso de celulares na pista de danca. Respeitar o horario do evento.',
 'Luzes neon, arte interativa, DJs ao vivo.',
 'Ingressos VIP, pulseiras de acesso, drinks neon.',
 '#NeonLights #DanceAllNight #NeonVibes #InteractiveArt'),

('Glamour Night', '2025-08-15 21:00:00', '2025-08-16 02:00:00',
 'Noite glamourosa com tapete vermelho, moda e shows de artistas internacionais.',
 'https://example.com/glamour_night.jpg',
 'Traje formal e sapatos elegantes. Proibido a entrada de menores de 18 anos.',
 'Tapete vermelho, moda, shows internacionais.',
 'Ingressos VIP, tapete vermelho, brindes de patrocinadores.',
 '#GlamourNight #RedCarpet #FashionShow #ExclusiveEvent'),

('Cosmic Journey', '2025-08-20 22:00:00', '2025-08-21 05:00:00',
 'Evento futurista com decoracao cosmica, DJs e uma imersao sonora de tirar o folego.',
 'https://example.com/cosmic_journey.jpg',
 'Proibido o uso de celulares durante a performance. Traje futurista recomendado.',
 'Decoracao cosmica, musica eletronica, iluminacao imersiva.',
 'Ingressos VIP, pulseiras de acesso, brindes cosmicos.',
 '#CosmicJourney #FuturisticEvent #CosmicVibes #ElectronicMusic'),

('Carnaval Prive', '2025-08-25 20:00:00', '2025-08-26 03:00:00',
 'Festa de carnaval exclusiva com desfiles e shows de samba ao vivo.',
 'https://example.com/carnaval_prive.jpg',
 'Traje de carnaval obrigatorio. Proibido o uso de cameras profissionais.',
 'Desfiles de carnaval, samba ao vivo, bebidas tropicais.',
 'Ingressos VIP, fantasias exclusivas, pulseiras de acesso.',
 '#CarnavalPrive #Samba #ExclusiveEvent #BrazilianParty');

INSERT INTO posts (user_id, event_id, image_post, content, data_postagem)
VALUES
=()

