DROP DATABASE IF EXISTS partylife;
CREATE DATABASE partylife WITH ENCODING 'UTF8';

\c partylife;

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    local VARCHAR(255) NOT NULL,
    time_start TIMESTAMP NOT NULL,
    time_end TIMESTAMP NOT NULL,
    event_photo TEXT NOT NULL,
    description TEXT NOT NULL,
    events_rules TEXT NOT NULL,
    party_itens TEXT NOT NULL,
    take_products TEXT NOT NULL,
    attractions TEXT,
    attractions_name TEXT,
    styles TEXT,    
    styles_name TEXT,
    hashtags TEXT NOT NULL
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
('Lucas Pereira', '@menorKabrinha', 'lucaspereira@gmail.com', '123456', 'https://lets.events/blog/wp-content/uploads/2017/05/saiba-quais-sao-as-principais-competencias-de-um-produtor-de-eventos.jpeg', 'Produtor de eventos.'),
('Julia River', '@juliariver', 'juliariver@gmail.com', '123456', 'https://img.freepik.com/fotos-gratis/mulher-bonita-celebrando-o-conceito-de-ano-novo_23-2148722189.jpg', 'Amante de festas e eventos.'),
('Livia Angelotti', '@angelotti', 'liviangelotti@gmail.com', '123456', 'https://www.paraisodasfestas.com.br/wp-content/uploads/2024/05/gestao-de-eventos.jpg', 'Amante de festas e eventos.'),
('Julia Mines', '@jujumines', 'jujumines@gmail.com', '123456', 'https://i.pinimg.com/736x/d9/08/91/d90891acd96959d790807a4a9b983663.jpg', 'Amante de festas e eventos.'),
('Kauã Lopez', '@xrcz', 'kaualopez@gmail.com', '123456', 'https://ampliar.org.br/wp-content/uploads/2021/04/aumenta-a-procura-de-cursos-online-durante-a-pandemia.jpg', 'Organizador de eventos.'),
('Gabriel Pereira', '@gp', 'gabrielpereira@gmail.com', '123456', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgKgxiPTwU8Gn-iWoQqFRPC69O9147iukCJg', 'DJ profissional.'),
('Caio Vieira', '@cabezinho', 'caiovieira@gmail.com', '123456', 'https://i.pinimg.com/736x/1e/42/2f/1e422fafeef7bd5917b07012b8831a6c.jpg', 'Produtor de Eventos.'),
('Ju Santos', '@jusantos', 'juliasantos@gmail.com', '123456', 'https://st4.depositphotos.com/13194036/22991/i/450/depositphotos_229919408-stock-photo-beautiful-young-woman-using-photo.jpg', 'Amante de festas e eventos.');

INSERT INTO events (title, local, time_start, time_end, event_photo, description, events_rules, party_itens, take_products, attractions, attractions_name, styles, styles_name, hashtags)
VALUES
('Rave da Cor', 'Nova Holanda', '2025-06-24 17:00:00', '2025-06-25 04:00:00','/uploads/raveBanner.png', 'Prepare-se para uma noite insana de batidas eletrônicas, luzes psicodélicas e muita energia! DJs renomados, open bar selecionado e uma vibe que vai até o amanhecer. Vista-se com cores neon e venha brilhar na pista!', 'Respeito é essencial – atitudes racistas, homofóbicas ou violentas resultarão em expulsão. Som externo é proibido - DJs oficiais garantem a música. Use pulseira de identificação o tempo todo. Não é permitido entrar com bebidas – teremos open bar e vendas no local. Preserve a praia - Lixo no lixo. Curta com consciência – se beber, não dirija.', 'Line-up de DJs insanos com os melhores nomes do eletrônico, trance e tech house. Open bar premium (em algumas áreas) e drinks exclusivos. Show de laser, fumaça e efeitos especiais.',
 'Protetor solar (se a festa for ao ar livre durante o dia). Documento com foto (RG, CNH ou versão digital – obrigatório para entrada). Óculos escuros. Ingresso/Pulseira (digital ou física, se for o caso). Boa vibe e disposição pra dançar até o fim!',
 'PartyLife2025, #RaveFest, #Coloridos, #VemProLuz'),

 ('Praia da Vila', 'Praia da Vila', '2025-06-22 15:00:00', '2025-06-22 23:00:00','/uploads/beachBanner.jpeg', 'Venha curtir o por do sol ao som de DJs incríveis drinks referescantes e boa vibrações!', 'Respeito é essencial – atitudes racistas, homofóbicas ou violentas resultarão em expulsão. Som externo é proibido - DJs oficiais garantem a música. Use pulseira de identificação o tempo todo. Não é permitido entrar com bebidas – teremos open bar e vendas no local. Preserve a praia - Lixo no lixo. Curta com consciência – se beber, não dirija.', 'Line-up de DJs insanos com os melhores nomes do eletrônico, trance e tech house. Open bar premium (em algumas áreas) e drinks exclusivos. Show de laser, fumaça e efeitos especiais.',
 'Protetor solar (se a festa for ao ar livre durante o dia). Documento com foto (RG, CNH ou versão digital – obrigatório para entrada). Óculos escuros. Ingresso/Pulseira (digital ou física, se for o caso). Boa vibe e disposição pra dançar até o fim!', 'PartyLife2025, FestaNaPraia, PéNaAreia, VemPraLuz'),

 ('Pool Party', 'Clube Lux', '2025-06-03 10:00:00', '2025-06-03 17:00:00','/uploads/poolBanner.jpeg', 'Sol, musica boa, piscina liberada e aquele clima tropical que a gente ama! Vem curtir uma tarde insana com DJs ao vivo, drinks gelados, gente bonita e muita energia! Traga seu melhor look de verao e prepare-se para mergulhar na vibe!', 'Proibido menores de 18 anos. E necessario traje de banho apropriado para usar a piscina. Documento com foto obrigatorio na entrada. Nao e permitido entrar com bebidas, teremos open bar e vendas no local. Revista na entrada e seguranças durante todo o evento. Respeito e lei atitudes agressivas, preconceituosas ou desrespeitosas nao serao toleradas.',
 'Danca na beira da piscina com competicao de melhor look. Drinks tropicais e open bar (opcional por area). Food zone com petiscos, hamburgueres e acai.',
 'Protetor solar - sol nao perdoa!. Roupa de banho (biquini, sunga ou maio). Oculos de sol estiloso. Cartao ou dinheiro para consumo no local. Boa vibe e disposicao para dancar e se molhar!',
 'PartyLife2025, PoolParty, Molhados, VemPraLuz'),

 ('Resenha em Casa', 'Rua krakauer scar, 7', '2025-05-21 21:00:00', '2025-05-22 04:00:00','/uploads/resenhaBanner.png', 'Vem aí a melhor resenha de todas! Vai rolar aquela festa em casa, com muita música, comida, bebida e gente legal! O clima vai ser leve  e descontraído - o tipo de noite que a gente não esquece!', 'Nada de briga e confusão. Som ambiente, sem incomodar os vizinhos. Sem exageros com o álcool. Respeito ao espaço alheio e não quebre nada. Confirme sua presença antes. Menores de idade apenas com acompanhante.', 'Som e playlist das músicas mais tocadas. Bebidas e drinks. Equipe de iluminação de festas.', 'Óculos estiloso. RG ou Documento com foto. Carregador de celular. Caixinha de som. Garrafa ou copo reutilizável.', 'PartyLife2025, FestaEmCasa, VibeBoa, VemPraLuz'),

 ('Encontro de Carros', 'Pista do CKP', '2025-05-09 20:00:00', '2025-05-10 02:00:00','/uploads/bannerCorrida.jpeg', 'Prepare-se para um evento que vai acelerar seu coração! Neste final de semana, os motores vão roncar alto no Encontro de Carros mais esperado da região! Clássicos, esportivos, antigos, rebaixados e modificados - todos reunidos em um só lugar para celebrar a paixão automotiva.', 'Proibido animais. Som automotivo controlado. Proibido o uso de bebidas alcoólicas por motoristas. Respeito ao espaço alheio. Lixo no lixo!. Menores de idade apenas com acompanhante.', 'Área de som automotivo. Sorteios e brindes. Concursos de destaques.', 'Caixa térmica com água e bebida. Dinhero ou cartão para consumação no local. Câmera ou celular carregado. Documento do veículo e CNH em dia. Boa atitude e respeito.', 'PartyLife2025, EncontroCarros, Automotivos, VemPraLuz');

('Palazzo Friday', 'Palazzo Club', '2025-07-12 22:00:00', '2025-07-13 05:00:00','/uploads/palazzoBanner.jpeg', 'A noite vai ferver com a energia dos motores potentes e um som que vai fazer o chão tremer! Uma mistura insana de música eletrônica e automobilismo.', 'Som automotivo liberado apenas em área específica. Proibido correr dentro do espaço do evento. Documento com foto obrigatório para entrada. Proibido o uso de drogas e atitudes agressivas', 'Line-up de DJs eletrônicos. Exposição de carros esportivos e clássicos. Sorteios de brindes automotivos. Área de food trucks com opções variadas.',
'Documento com foto (RG, CNH ou versão digital – obrigatório para entrada). Dinheiro ou cartão para consumo no local. Roupa confortável e vibe acelerada!.', 'PartyLife2025, #PalazzoFriday, #NoiteInesquecivel, #VemProLuz'),

('Summer Night Party', 'Praia do Leme', '2025-07-30 18:00:00', '2025-07-31 02:00:00','/uploads/summerNightBanner.jpeg', 'A festa mais esperada do verão carioca! Venha curtir o pôr do sol com os pés na areia, música eletrônica, drinks refrescantes e uma vibe incrível!', 'Permitido apenas maiores de 18 anos. Documento com foto obrigatório para entrada. Não é permitido entrar com bebidas. Use pulseira de identificação o tempo todo.', 'DJ sets ao vivo. Espaço com food trucks e drinks refrescantes.', 'Roupa tropical ou look de verão. Protetor solar. Documento com foto. Muita energia e disposição para dançar até o amanhecer!', 'PartyLife2025, #SummerNightParty, #PéNaAreia, #VemProLuz'),

('Silent Party', 'Rave da Ju', '2025-08-15 22:00:00', '2025-08-16 05:00:00','/uploads/silentPartyBanner.jpeg', 'A festa onde o silencio fala alto! Dance ao som da sua propria musica com fones de ouvido sem fio enquanto desfruta de um ambiente incrivel.', 'Permitido apenas maiores de 18 anos. Documento com foto obrigatório para entrada. Nao e permitido entrar com bebidas. Use pulseira de identificacao o tempo todo. E proibido compartilhar fones de ouvido. Respeito ao ambiente e aos demais convidados.', 'DJ ao vivo. Espaço com food trucks e drinks refrescantes. Área lounge e iluminacao LED interativa.', 'Roupa confortavel e vibe descontraida. RG ou documento digital. Fones(seram fornecidos no local). Muita energia e disposicao para dancar até o amanhecer!', 'PartyLife2025, #SilentParty, #RaveDaJu, #VemProLuz');


INSERT INTO posts (user_id, event_id, image_post, content, data_postagem)
VALUES
(1, 1, '/uploads/raveFestFeed.jpg', 'Rave do Menor, São Paulo', CURRENT_DATE),
(2, 2, '/uploads/beachFeed.jpg', 'Praia do Leme, Rio de Janeiro', CURRENT_DATE),
(3, 3, '/uploads/poolPartyFeed.jpg', 'Pool Party, São Paulo', CURRENT_DATE),
(4, 4, '/uploads/resenhaFeed.jpg', 'Casa da Juju, São Paulo', CURRENT_DATE),
(5, 5, '/uploads/car1.jpg', 'Pista do Tigre, São Paulo', CURRENT_DATE),
(6, 6, '/uploads/corridaPost.jpg', 'Pista do Tigre, São Paulo', CURRENT_DATE),
(7, 7, '/uploads/beachPost.jpg', 'Pista do Tigre, São Paulo', CURRENT_DATE),
(8, 8, '/uploads/ravePost.jpg', 'Rave da Ju, São Paulo', CURRENT_DATE);
