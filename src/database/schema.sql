DROP DATABASE IF EXISTS partylife;
CREATE DATABASE partylife WITH ENCODING 'UTF8';

\c partylife;

CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    local VARCHAR(255) NOT NULL,
    time_start TIMESTAMP,
    time_end TIMESTAMP,
    event_photo TEXT,
    description TEXT,
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
('Maria Eduarda', 'mariaeduarda', 'maria@gmail.com', '123456', 'https://img.freepik.com/fotos-gratis/mulher-bonita-celebrando-o-conceito-de-ano-novo_23-2148722189.jpg', 'Amante de festas e eventos.'),
('Joao Silva', 'joaosilva', 'joao@gmail.com', '123456', 'https://ampliar.org.br/wp-content/uploads/2021/04/aumenta-a-procura-de-cursos-online-durante-a-pandemia.jpg', 'Organizador de eventos.'),
('Ana Paula', 'anapaula', 'ana@gmail.com', '123456', 'https://www.paraisodasfestas.com.br/wp-content/uploads/2024/05/gestao-de-eventos.jpg', 'Especialista em decoracao de festas.'),
('Carlos Mendes', 'carlosm', 'carlos@gmail.com', '123456', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgKgxiPTwU8Gn-iWoQqFRPC69O9147iukCJg', 'DJ profissional.'),
('Fernanda Lima', 'fernandal', 'fernanda@gmail.com', '123456', 'https://st4.depositphotos.com/13194036/22991/i/450/depositphotos_229919408-stock-photo-beautiful-young-woman-using-photo.jpg', 'Fotografa de eventos.'),
('Lucas Pereira', 'lucasp', 'lucas@gmail.com', '123456', 'https://lets.events/blog/wp-content/uploads/2017/05/saiba-quais-sao-as-principais-competencias-de-um-produtor-de-eventos.jpeg', 'Produtor de eventos.');

INSERT INTO events (title, local, time_start, time_end, event_photo, description, events_rules, party_itens, take_products, hashtags)
VALUES
('Rave da Cor', 'Nova Holanda', '2025-06-24 17:00:00', '2025-06-25 04:00:00','/images/raveBanner.png', 'Prepare-se para uma noite insana de batidas eletrônicas, luzes psicodélicas e muita energia! DJs renomados, open bar selecionado e uma vibe que vai até o amanhecer. Vista-se com cores neon e venha brilhar na pista!',
 'Respeito é essencial – atitudes racistas, homofóbicas ou violentas resultarão em expulsão. Som externo é proibido - DJs oficiais garantem a música. Use pulseira de identificação o tempo todo. Não é permitido entrar com bebidas – teremos open bar e vendas no local. Preserve a praia - Lixo no lixo. Curta com consciência – se beber, não dirija.',
 'Line-up de DJs insanos com os melhores nomes do eletrônico, trance e tech house. Open bar premium (em algumas áreas) e drinks exclusivos. Show de laser, fumaça e efeitos especiais.',
 'Protetor solar (se a festa for ao ar livre durante o dia). Documento com foto (RG, CNH ou versão digital – obrigatório para entrada). Óculos escuros. Ingresso/Pulseira (digital ou física, se for o caso). Boa vibe e disposição pra dançar até o fim!',
 'PartyLife2025, #RaveFest, #Coloridos, #VemProLuz'),

('Praia da Vila', 'Praia da Vila', '2025-06-22 15:00:00', '2025-06-22 23:00:00','/images/beachBanner.jpeg', 'Venha curtir o por do sol ao som de DJs incríveis drinks referescantes e boa vibrações!', 'Respeito é essencial – atitudes racistas, homofóbicas ou violentas resultarão em expulsão. Som externo é proibido - DJs oficiais garantem a música. Use pulseira de identificação o tempo todo. Não é permitido entrar com bebidas – teremos open bar e vendas no local. Preserve a praia - Lixo no lixo. Curta com consciência – se beber, não dirija.', 'Line-up de DJs insanos com os melhores nomes do eletrônico, trance e tech house. Open bar premium (em algumas áreas) e drinks exclusivos. Show de laser, fumaça e efeitos especiais.',
 'Protetor solar (se a festa for ao ar livre durante o dia). Documento com foto (RG, CNH ou versão digital – obrigatório para entrada). Óculos escuros. Ingresso/Pulseira (digital ou física, se for o caso). Boa vibe e disposição pra dançar até o fim!',
 'PartyLife2025, FestaNaPraia, PéNaAreia, VemPraLuz'),

('Pool Party', 'Clube Lux', '2025-06-03 10:00:00', '2025-06-03 17:00:00','/images/poolBanner.jpeg', 'Sol, musica boa, piscina liberada e aquele clima tropical que a gente ama! Vem curtir uma tarde insana com DJs ao vivo, drinks gelados, gente bonita e muita energia! Traga seu melhor look de verao e prepare-se para mergulhar na vibe!', 'Proibido menores de 18 anos. E necessario traje de banho apropriado para usar a piscina. Documento com foto obrigatorio na entrada. Nao e permitido entrar com bebidas, teremos open bar e vendas no local. Revista na entrada e seguranças durante todo o evento. Respeito e lei atitudes agressivas, preconceituosas ou desrespeitosas nao serao toleradas.',
 'Danca na beira da piscina com competicao de melhor look. Drinks tropicais e open bar (opcional por area). Food zone com petiscos, hamburgueres e acai.',
 'Protetor solar - sol nao perdoa!. Roupa de banho (biquini, sunga ou maio). Oculos de sol estiloso. Cartao ou dinheiro para consumo no local. Boa vibe e disposicao para dancar e se molhar!',
 'PartyLife2025, PoolParty, Molhados, VemPraLuz'),

 ('Resenha em Casa', 'Rua krakauer scar, 7', '2025-05-21 21:00:00', '2025-05-22 04:00:00','/images/resenhaBanner.png', 'Vem aí a melhor resenha de todas! Vai rolar aquela festa em casa, com muita música, comida, bebida e gente legal! O clima vai ser leve  e descontraído - o tipo de noite que a gente não esquece!', 'Nada de briga e confusão. Som ambiente, sem incomodar os vizinhos. Sem exageros com o álcool. Respeito ao espaço alheio e não quebre nada. Confirme sua presença antes. Menores de idade apenas com acompanhante.', 'Som e playlist das músicas mais tocadas. Bebidas e drinks. Equipe de iluminação de festas.', 'Óculos estiloso. RG ou Documento com foto. Carregador de celular. Caixinha de som. Garrafa ou copo reutilizável.', 'PartyLife2025, FestaEmCasa, VibeBoa, VemPraLuz'),

 ('Encontro de Carros', 'Pista do CKP', '2025-05-09 20:00:00', '2025-05-10 02:00:00','/images/bannerCorrida.jpeg', 'Prepare-se para um evento que vai acelerar seu coração! Neste final de semana, os motores vão roncar alto no Encontro de Carros mais esperado da região! Clássicos, esportivos, antigos, rebaixados e modificados - todos reunidos em um só lugar para celebrar a paixão automotiva.', 'Proibido animais. Som automotivo controlado. Proibido o uso de bebidas alcoólicas por motoristas. Respeito ao espaço alheio. Lixo no lixo!. Menores de idade apenas com acompanhante.', 'Área de som automotivo. Sorteios e brindes. Concursos de destaques.', 'Caixa térmica com água e bebida. Dinhero ou cartão para consumação no local. Câmera ou celular carregado. Documento do veículo e CNH em dia. Boa atitude e respeito.', 'PartyLife2025, EncontroCarros, Automotivos, VemPraLuz');

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

