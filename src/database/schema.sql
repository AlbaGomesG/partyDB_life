DROP DATABASE IF EXISTS partylife;
CREATE DATABASE partylife WITH ENCODING 'UTF8';

\c partylife;


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    perfil_photo TEXT NOT NULL,
    name VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL,
    senha VARCHAR(100) NOT NULL
);

CREATE TABLE users_info (
    id INTEGER PRIMARY KEY REFERENCES users(id) ON DELETE CASCADE,
    name VARCHAR(100) NOT NULL,
    bio TEXT
);

CREATE OR REPLACE FUNCTION insert_users_info()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO users_info (id, name, bio)
    VALUES (NEW.id, NEW.name, NULL); 
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_user_insert
AFTER INSERT ON users
FOR EACH ROW
EXECUTE FUNCTION insert_users_info();

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

INSERT INTO users (name, perfil_photo, username, email, senha) VALUES
('Lucas Pereira', 'https://lets.events/blog/wp-content/uploads/2017/05/saiba-quais-sao-as-principais-competencias-de-um-produtor-de-eventos.jpeg', '@menorKabrinha', 'lucaspereira@gmail.com', '123456'),
('Julia River', 'https://i.pinimg.com/736x/cd/e8/e0/cde8e058f48e591e1d4e8fe9c2fbc0af.jpg', '@juliariver', 'juliariver@gmail.com', '123456'),
('Livia Angelotti',  'https://www.paraisodasfestas.com.br/wp-content/uploads/2024/05/gestao-de-eventos.jpg', '@angelotti', 'liviangelotti@gmail.com', '123456'),
('Julia Mines', 'https://i.pinimg.com/736x/d9/08/91/d90891acd96959d790807a4a9b983663.jpg', '@jujumines', 'jujumines@gmail.com', '123456'),
('Kauã Lopez', 'https://ampliar.org.br/wp-content/uploads/2021/04/aumenta-a-procura-de-cursos-online-durante-a-pandemia.jpg', '@xrcz', 'kaualopez@gmail.com', '123456'),
('Gabriel Pereira', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTgKgxiPTwU8Gn-iWoQqFRPC69O9147iukCJg', '@gp', 'gabrielpereira@gmail.com', '123456'),
('Caio Vieira', 'https://i.pinimg.com/736x/1e/42/2f/1e422fafeef7bd5917b07012b8831a6c.jpg', '@cabezinho', 'caiovieira@gmail.com', '123456'),
('Juliana Santos', 'https://st4.depositphotos.com/13194036/22991/i/450/depositphotos_229919408-stock-photo-beautiful-young-woman-using-photo.jpg', '@jusantos', 'julianasantos@gmail.com', '123456');

INSERT INTO events (title, local, time_start, time_end, event_photo, description, events_rules, party_itens, take_products, attractions, attractions_name, styles, styles_name, hashtags)
VALUES
('Rave da Cor', 
'Nova Holanda', 
'2025-06-24 17:00:00', 
'2025-06-25 04:00:00',
'/uploads/raveBanner.png', 
'Prepare-se para uma noite insana de batidas eletrônicas, luzes psicodélicas e muita energia! DJs renomados, open bar selecionado e uma vibe que vai até o amanhecer. Vista-se com cores neon e venha brilhar na pista!', 
'Respeito é essencial – atitudes racistas, homofóbicas ou violentas resultarão em expulsão. Som externo é proibido - DJs oficiais garantem a música. Use pulseira de identificação o tempo todo. Não é permitido entrar com bebidas – teremos open bar e vendas no local. Preserve a praia - Lixo no lixo. Curta com consciência – se beber, não dirija.', 
'Line-up de DJs insanos com os melhores nomes do eletrônico, trance e tech house. Open bar premium (em algumas áreas) e drinks exclusivos. Show de laser, fumaça e efeitos especiais.',
'Protetor solar (se a festa for ao ar livre durante o dia). Documento com foto (RG, CNH ou versão digital – obrigatório para entrada). Óculos escuros. Ingresso/Pulseira (digital ou física, se for o caso). Boa vibe e disposição pra dançar até o fim!',
'https://admin.cnnbrasil.com.br/wp-content/uploads/sites/12/2024/11/alok-3-e1732129463931.jpg?w=1200&h=675&crop=1, https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTpEZcgpTIGlCIoPV_ixuxtT4vfBdnWx0SAcBYkarbKRRzKNvPs8NsQ9q4tZ0Q1pB-tU04&usqp=CAU',
'Alok, Matue',
'https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEUraSd4hQR9MMQktAskC0McWBqey8iYgJqpTL99T3UzDbaKAq3YZ0kM%2BWA0afDi41tBio%2BGN9qlYEbSdnD6Ukgu%2BkY0bSqZOK10phsFoztX9hVB7BIyTmsEeBLNy7nKS97LVJU4Ku8cN96Q%2FYX71IPUvkosZ8pD2%2FFl3757tbc7hkHYeBVgNF2adg5vO9q5yDGcd6wPF7DQECjkCDtNcfmI99Is4DHURqbW2iBwyKIpzfIVj0f6ifB3jve7OzzZDLmS1Ztht2myLqrD4RJLIaFk5mIAZLspIJ2tOEGeY1566ugAzhcOZWZgjpkjuk4AdWgt0JDeKZyt1qFpZ4EsTvTEapAP0sOmhYnfFtWCfUwMNaOeJ3YfBAkKEMMbfY%2B3PTy6qrk%2B8PtF9SJXbjlAIWp9BPqB0qx28EpiHvdeDS189r5DsaUoyz%2B1CMKXGp0kbDmBrB%2Ba%2BEAWYG7DZvGtwtU%2FIrGud0eHUhfurmj7FS7LjTLyJ06fI4n8sEkgq9MeN3X6sLvoZISmnC8iVF8iQRTU5bp9Y%2BcZw0J7tOpHUs5A2RxeS2M%2FIU9c0mUD74k%3D&allow_caching=true&sz=w1920-h945, https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEVv3PCObw%2B5ejHbV%2BmyLsQZ9ippGTIw0dARqTsDpjMoTDNkRsiwmGEJdKi7AeKExuFXH2NWPaoJHbwfPN73HR2LQbn9hLkwd2%2FGh7lN0cS7v0fEkr12Qi0DZwoDyWx5Iyf2NB7anVh5Q0%2FG5oe9%2FzA%2BU1P0WR3PLguY7KZgjYPeMlRKGOLhvmv9cWEPI0kwF8qlo3TAGS4mtSVyp1X53xU%2FZYFU5%2F98FygckBGXsoFnEIhVt2HPt7TC2c%2FKx6FrEhC90w3HLpBrzLWKSanGtR%2FcopM%2B2pztRRd7UYmLNtb%2FK1MiwbU8JGJdnvh8iPh6EfpG0kDUibmbQ9ZpLiqUrMUWctsnxQoOrJY07LZnC178tBrn8XVdDccg%2B1JsjMVqjobklrd4Rmkdh8CKYZjq%2FcBOisrH7POyqY3BMKU%2FJ%2FeBfJXbqmbeU192kepbzATLgsYA1HCZW4Rg9TG0m9leOulUfXb7TyKJEVJA5NK2upT4lLMiuLtOhNM4MRzDg%2B68%2BNeEkJNB1BscV2lwBSgjs561oFQMUP8qmWkT8OcQq3nLLQ22JeQEpz%2FNb2ycFEQA&allow_caching=true&sz=w1920-h945',
'Eletrônica, Trap',
'PartyLife2025, #RaveFest, #Coloridos, #VemPraLuz'),

('Praia da Vila', 
'Praia da Vila', 
'2025-06-22 15:00:00', 
'2025-06-22 23:00:00',
'/uploads/beachBanner.jpeg', 
'Venha curtir o por do sol ao som de DJs incríveis drinks referescantes e boa vibrações!', 
'Respeito é essencial – atitudes racistas, homofóbicas ou violentas resultarão em expulsão. Som externo é proibido - DJs oficiais garantem a música. Use pulseira de identificação o tempo todo. Não é permitido entrar com bebidas – teremos open bar e vendas no local. Preserve a praia - Lixo no lixo. Curta com consciência – se beber, não dirija.', 
'Line-up de DJs insanos com os melhores nomes do eletrônico, trance e tech house. Open bar premium (em algumas áreas) e drinks exclusivos. Show de laser, fumaça e efeitos especiais.',
'Protetor solar (se a festa for ao ar livre durante o dia). Documento com foto (RG, CNH ou versão digital – obrigatório para entrada). Óculos escuros. Ingresso/Pulseira (digital ou física, se for o caso). Boa vibe e disposição pra dançar até o fim!', 
'https://diariodonordeste.verdesmares.com.br/image/contentid/policy:1.3482944:1708979124/Natiruts.jpg?f=default&$p$f=1321206',
'Natiruts',
'https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEW%2BePWKF9rrJ%2FGv3lIEobVPju9eKLXMYrANFdJjj6m%2BU23outrqwRil9upg3s18WBjGGHnR3FZ2ZQRD3maPts7n5o8EE5deIK8U2TjcDrWMm4TDKPBOd698PnhPbiFxWQVIMYc%2Fj7Jt9B6WuPQ%2BaKZnHOq%2BTt1ERR9T7IKbiMFQo1ykvNrdLynvh5Ujo5v05DMgY939IPYz6pTKI7Ntk9PKheWIKCpXJomBEInIEU0gIugMUstLPfzywtEWNPCAOZrqztlckCZBY3FcwnJrqlR7T%2BorpXuS%2FwHVqDmdInJqhHpHwZSXZHduc15eJPgqyNKCbfR7rw2KMh7%2F2q6lLFZXFFML%2BIMIeAU9JUplAIbGqHs%2FNt76FvJzyU7Rt0UYLUmzf%2FmW45m67hJpqgvg0t11fpndId9N8%2FF8qM3ebJfEHvnHyJA34O7SCJ6cvjp6J11Poa6pHJA9XTagIP%2FIHqXAdr%2BkTQ24IC15R3sDobKubEA0Xuu%2FiSujQNh2BziWUKVRxwuneZ6Y81NLBnME9sc98kY44Kmobsy3JnKpEAr5UUkBmWPUuEbKjVw7egFXhfU%3D&allow_caching=true&sz=w1920-h945, https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEXR0fnzQl7vP8%2BQa2FGL3Go9GueV%2BIIi0%2FQFV5xjcIkfUeMmMOsZ9ndgKPzC5M9amAY55f3UrGIuP0Wy9tGqRx3GdA6MlvbgAtB8EUxDx0QMjmyajkqXLJDNftR1614PwuDnvQEtlzG%2F%2BD1ognpgS%2BQEUME9lBOJEGWTHYCa4aCCuddpuPy94UcwTWaEs0JeYGdRek85rQdskLpyI551rlk8xFDr%2F0aJRHcE5oV0Mr2AY1czxKlCJA2clTvZBC6gNPfbZw1iOLyOFmG4q1jqm%2FZ8r5MyFp7slKuldua67cgqDgbOcyMPMzswPGkPhB%2Bnpe4hUp8EkTLYVfbGf0jytJ00hQGwrNNcJPZ5%2FiLAz2QC7U5%2BLWXiX2k2PWb%2BpWeaSeuVvwm%2Bhv0jjGAR6Q6E0VYw67rd7cneueLSxMGe0JI6dhNDqj%2FhdTPlqZfWy6kURCEt8AuQYoXB8%2Fli5kiWKRrykvIW7fPjQNwT6WWZbnZeQJc0s4uqvG1ufGvkQnOeB1Su8TEs7fvkOlzUIGwYwgzmovk74ZLQfLkWQWZPOQ9t%2BeWHqcCkzHcAPcqbRRJvygwxg%3D%3D&allow_caching=true&sz=w1920-h945',
'Reggae, Eletrônica',
'PartyLife2025, FestaNaPraia, PéNaAreia, VemPraLuz'),

('Pool Party', 
'Clube Lux', 
'2025-06-03 10:00:00', 
'2025-06-03 17:00:00',
'/uploads/poolBanner.jpeg', 
'Sol, musica boa, piscina liberada e aquele clima tropical que a gente ama! Vem curtir uma tarde insana com DJs ao vivo, drinks gelados, gente bonita e muita energia! Traga seu melhor look de verao e prepare-se para mergulhar na vibe!', 
'Proibido menores de 18 anos. E necessario traje de banho apropriado para usar a piscina. Documento com foto obrigatorio na entrada. Nao e permitido entrar com bebidas, teremos open bar e vendas no local. Revista na entrada e seguranças durante todo o evento. Respeito e lei atitudes agressivas, preconceituosas ou desrespeitosas nao serao toleradas.',
'Danca na beira da piscina com competicao de melhor look. Drinks tropicais e open bar (opcional por area). Food zone com petiscos, hamburgueres e acai.',
'Protetor solar - sol nao perdoa!. Roupa de banho (biquini, sunga ou maio). Oculos de sol estiloso. Cartao ou dinheiro para consumo no local. Boa vibe e disposicao para dancar e se molhar!',
'https://www.bandab.com.br/wp-content/uploads/2023/05/menos-e-mais-em-curitiba-foto-Jhonnathas-Franco-960x592.jpg.webp',
'Menos é Mais',
'https://sdmntprwestcentralus.oaiusercontent.com/files/00000000-84bc-61fb-87c0-e0d013550254/raw?se=2025-06-03T17%3A15%3A56Z&sp=r&sv=2024-08-04&sr=b&scid=16f65e5d-86d8-506f-8148-c6714c4f011d&skoid=b64a43d9-3512-45c2-98b4-dea55d094240&sktid=a48cca56-e6da-484e-a814-9c849652bcb3&skt=2025-06-03T10%3A56%3A18Z&ske=2025-06-04T10%3A56%3A18Z&sks=b&skv=2024-08-04&sig=YKNKJ%2BAZctc1ZSeFh0DvvCsk9x%2BzWl%2BYWgOLLfmJBZ4%3D',
'Pagode',
'PartyLife2025, PoolParty, Molhados, VemPraLuz'),

('Resenha em Casa', 
'Rua krakauer scar, 7', 
'2025-05-21 21:00:00', 
'2025-05-22 04:00:00',
'/uploads/resenhaBanner.png', 
'Vem aí a melhor resenha de todas! Vai rolar aquela festa em casa, com muita música, comida, bebida e gente legal! O clima vai ser leve  e descontraído - o tipo de noite que a gente não esquece!', 
'Nada de briga e confusão. Som ambiente, sem incomodar os vizinhos. Sem exageros com o álcool. Respeito ao espaço alheio e não quebre nada. Confirme sua presença antes. Menores de idade apenas com acompanhante.', 
'Som e playlist das músicas mais tocadas. Bebidas e drinks. Equipe de iluminação de festas.', 
'Óculos estiloso. RG ou Documento com foto. Carregador de celular. Caixinha de som. Garrafa ou copo reutilizável.', 
'https://www.jornaldorap.com.br/wp-content/uploads/2021/06/mc-don-juan.jpg, https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQQERSsCQpClBvMXmUC7zhsWUlwDz1rfyicVQ&s, https://dicionariompb.com.br/wp-content/uploads/2022/12/mc-cabelinho.jpeg',
'Mc Don Juan, Mc Cabelinho',
'https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEXStomk3gBQTTRUmv6gKweMdQFUPAWDw3XvzpCf9Va8LUsoc1Mw%2Bw8HuDO0N67wrivBHjt54D5okKlsHiPOZpmos%2Fr2LkPcfY7NkiI60HGs3p9HvXMgq6tGVBl5QQaJeeGmRVgGbYEH6dHWPtCtNp7UU%2F3%2FvQB9iH0dEiL8g99xEZ2CvWQt2tn6aTq11NiIrvINl7wPHHFn4o%2BD%2BbotvPu%2Bsb%2BFPSrlCdC0uzXuqsDb2vzgZGYl%2B66RzrdDgFR6wVYrukIA4SmfSAaL5tcWeCSQAlTnV93sw%2FfRKNMe1kRDnbx%2B82G05l1paBUWpwz3cwwAeLwYz2nrS8vMsMAPN6UgoD6GsW4epQN6FW2qYTQnCsMS6bmX1gIBBKtIsFTPqW8Maza3w4Z5mDb38VFkAGU3QMqooVGjE%2B0AkC%2BnOPGpR7%2FfUsgJkEVkWLi%2F3DOgc9k4lVw3yoiR467MjODoSRkKuhbxawxOhkTBkgMvQQiqg9fn1r4al8Za8iDW%2B1mbcPWIkiDMcCosz1arR3pL2Bj89rUqWK%2FWvbQcL9%2FqEg%2F6IejUF%2B08qvsaYFTcvhs3HTg%3D&allow_caching=true&sz=w1920-h945',
'Funk',
'PartyLife2025, FestaEmCasa, VibeBoa, VemPraLuz'),

('Encontro de Carros', 
'Pista do CKP', 
'2025-05-09 20:00:00', 
'2025-05-10 02:00:00', 
'/uploads/bannerCorrida.jpeg', 
'Prepare-se para um evento que vai acelerar seu coração! Neste final de semana, os motores vão roncar alto no Encontro de Carros mais esperado da região! Clássicos, esportivos, antigos, rebaixados e modificados - todos reunidos em um só lugar para celebrar a paixão automotiva.', 
'Proibido animais. Som automotivo controlado. Proibido o uso de bebidas alcoólicas por motoristas. Respeito ao espaço alheio. Lixo no lixo!. Menores de idade apenas com acompanhante.', 
'Área de som automotivo. Sorteios e brindes. Concursos de destaques.', 
'Caixa térmica com água e bebida. Dinheiro ou cartão para consumação no local. Câmera ou celular carregado. Documento do veículo e CNH em dia. Boa atitude e respeito.', 
'https://api.dialbrasil.com.br/webroot/files/Contents/image_medium_name/20241113124206Capital-Inicial-anuncia-turne-comemorativa-de-25-anos-do-album-Acustico-MTV-Capital-Inicial.png', 
'Capital Inicial',
'https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEWlWcWvtyMFYdgA38dSvPpkhrURJS7Yjh8gMTYGYhGNHkBbOsklI7ytAS7ZJZv1AJe7m%2F8BpB9C%2BQorIXb7M%2F8Y8SOZvXTzLPw7xkGWH4ekiZhT65SfZUNQZ%2BL451cdwA7eQXUCtivtMkosCA9WAk6glTtO95KrLbjqCKznRn9oxor8Gg1xon2FdB5ZR9SZzvFZPLpBo%2BoManFvm6BzQC8so2jJIgjpQbx5oxAcclbvtvQaBB4aZulJAFVzJMpM8NId8OnZkX8%2FgQfYVcEKlf2tLfd8waTRxXfztqFqC86TBQyPny50mb4Rtdeb%2FoHrTi%2BmaW0gweO2RxhlUHlXU%2B0r15YhsVWF9bSPLihcLARmk3Ue5KBa%2FwMwEu1K0oUZcsZhqWGlE1YAqtimVPIKEk22GvNktUsjpjg6nPE2bAS3vLQwXgS93zw5AbEWbiC%2FLBFN7q9ntrmzUk6z%2FpGb%2FRrokiTxHGaD2%2Bg5dhKJZVEEiSYTK5vt556EEeOT6zN15Ohrzsn8ofRdGMdZ8o1FLMoixf83g2fYaTW603jJudkzbDatxY2A9bjyvsWgCfPfuHZ7&allow_caching=true&sz=w1920-h945',
'Rock',
'PartyLife2025, EncontroCarros, Automotivos, VemPraLuz'),

('Palazzo Friday', 
'Palazzo Club', 
'2025-07-12 22:00:00', 
'2025-07-13 05:00:00',
'/uploads/palazzoBanner.jpeg', 
'A noite vai ferver com a energia dos motores potentes e um som que vai fazer o chão tremer! Uma mistura insana de música eletrônica e automobilismo.', 
'Som automotivo liberado apenas em área específica. Proibido correr dentro do espaço do evento. Documento com foto obrigatório para entrada. Proibido o uso de drogas e atitudes agressivas', 
'Line-up de DJs eletrônicos. Exposição de carros esportivos e clássicos. Sorteios de brindes automotivos. Área de food trucks com opções variadas.',
'Documento com foto (RG, CNH ou versão digital – obrigatório para entrada). Dinheiro ou cartão para consumo no local. Roupa confortável e vibe acelerada!.', 
'https://f.i.uol.com.br/fotografia/2020/12/03/16070249525fc94138cbe92_1607024952_1x1_md.jpg, https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe3SukW-zbElHADY1rdtpDgH9aGHzmWNI8fQ&s',
'Bruno Martini, Eli Iwasa',
'https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEWq3NkA7eU8Yw%2FRJA6xAgGO0d97PgoLy5s0HNY1GeB6VIF3nV4KXaEx4eFHCMuGWWxnv2VGkxg30aeDC8ifhd0xhrZU10rzX2W0O03eg6ZRagCmmlJcDThY4sHA9jU0Ik8SrTYo3Y34SsM9x13zi1z2Dn5H8i8O5DeVrrcf15SOouuknkdUrkrqUSrKXE4wfutPG4MFe8P1FSawyKAuwDwdo2Wix2lOIJVmPA49C3LkbnVapUHDP2msSTf0zrxQqW83VfM8QWyztzVEiR8dDLyZDuLQIoytJhHAHKqRtJBrMfPWilh9ScVFQvnsw%2B1hOxWIgHUgqvgi9hNaMgN7DgA6im4%2FFjKqL1H09Z8n78ZwTHYEA7islEr1olrt%2F14WldroSFPc1L7NuOsaPmntXB6d%2F6pqrIx5IUpdTy5aOFD5e%2B%2BiPrqx0pV%2FxAzNSB028gR5hK%2B%2BmXURRVH2zNvkj%2F0CbtwFjFzCKwcS9hJrJSJhCsddTlBC5WQDXIC7XaC89B0r5gelLu81MiU7DfnjAFRPcl0yQjl7mOeg4GDizWwhUQoQlkWrR1Vlna6LcmvhjywPzw%3D%3D&allow_caching=true&sz=w1920-h889',
'Eletrônica',
'PartyLife2025, #PalazzoFriday, #NoiteInesquecivel, #VemProLuz'),

('Summer Night Party',
'Praia do Leme', 
'2025-07-30 18:00:00', 
'2025-07-31 02:00:00',
'/uploads/summerNightBanner.jpeg', 
'A festa mais esperada do verão carioca! Venha curtir o pôr do sol com os pés na areia, música sertaneja, drinks refrescantes e uma vibe incrível!', 
'Permitido apenas maiores de 18 anos. Documento com foto obrigatório para entrada. Não é permitido entrar com bebidas. Use pulseira de identificação o tempo todo.', 
'Sets ao vivo. Espaço com food trucks e drinks refrescantes.', 
'Roupa tropical ou look de verão. Protetor solar. Documento com foto. Muita energia e disposição para dançar até o amanhecer!',
'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRip_WAtSyjK8pknSQdJtIN4fFV27eBtoTSjQ&s',
'Diego e Victor Hugo',
'https://chat.google.com/u/0/api/get_attachment_url?url_type=FIFE_URL&content_type=image%2Fpng&attachment_token=AOo0EEWcSvzZJ%2BNudu%2FNPBhZB7bGgh0GQv%2Bex%2FLdgiCHcsazGR%2FlzNZkOalDx07mKnBF%2B2NDbY5hOlmZmxU32E3IAzR%2FynBFLn%2BQlcagtZuW3U16Pqq4FCz5aDpnltgTRsNhGiq7LgsWnD3ThtL%2BeUjjY1Ca4OhhA%2F6ia173MoKXl1ADZw2wFQ3%2B8QAkVnl6yTmZEd9XUecmvjV6D4R2m9p3oGQosKjfiPgRAbPjdvyLFX9nkp617%2Fh0%2FmJD3dbWqxrwMP1qGAoUZpaMEBTjXtRifNzmSwWw%2B8K%2FXcWS%2BckEmqXb%2B55vdEA3rH4%2BtR7R13ZEK0UOejJm0wwN0tp8U58PZZMJ5qTJkgRO%2FqJDiScH8Re1BVpPmtN3%2FXsSkcWPvsZpu%2ByZUhGQc3SGBpez5ySUZbNl7FOcvqtU7XTBpEw85%2BvtiUR0pNqTo7Qtim2naOogD%2FxcLs6w%2FmaaNeHdfJuvPwcI9kzkMFV4RhoAt43FeuHYVIQCggISrPZ1PTC17POvTvXELF1vM0W8FB9prmXSFOYLtqUnq2c115rQD1Nw8iiJBSDu2zjdD0Yd69nmy55%2BRg%3D%3D&allow_caching=true&sz=w1920-h889',
'Sertanejo',
'PartyLife2025, #SummerNightParty, #PéNaAreia, #VemProLuz'),

('Silent Party', 
'Rave da Ju', 
'2025-08-15 22:00:00', 
'2025-08-16 05:00:00',
'/uploads/silentPartyBanner.jpeg', 
'A festa onde o silencio fala alto! Dance ao som da sua propria musica com fones de ouvido sem fio enquanto desfruta de um ambiente incrivel.', 
'Permitido apenas maiores de 18 anos. Documento com foto obrigatório para entrada. Nao e permitido entrar com bebidas. Use pulseira de identificacao o tempo todo. E proibido compartilhar fones de ouvido. Respeito ao ambiente e aos demais convidados.', 
'DJ ao vivo. Espaço com food trucks e drinks refrescantes. Área lounge e iluminacao LED interativa.', 
'Roupa confortavel e vibe descontraida. RG ou documento digital. Fones(seram fornecidos no local). Muita energia e disposicao para dancar até o amanhecer!', 
NULL,
NULL,
NULL,
NULL,
'PartyLife2025, #SilentParty, #RaveDaJu, #VemProLuz');

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