-- Criando um novo banco de dados
CREATE DATABASE eu_indico;

-- Selecionando o banco de dados que será usado
USE eu_indico;

-- Tabela de usuários
CREATE TABLE usuario (
	user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_nome VARCHAR(100) NOT NULL,
    user_email VARCHAR(100) NOT NULL,
    user_senha VARCHAR(100) NOT NULL
);
select * from livros;

-- Tabela de gêneros
CREATE TABLE genero (
    gen_id INT AUTO_INCREMENT PRIMARY KEY,        -- Chave primária
    gen_nome VARCHAR(150) NOT NULL                -- Nome do gênero
);

-- Tabela de filmes
CREATE TABLE filmes (
    fil_id INT AUTO_INCREMENT PRIMARY KEY,        -- Chave primária
    genero_filme_id INT,                          -- Gênero do filme (genero_filme_id apenas para saber o nome da tabela filme )
    fil_nome VARCHAR(150) NOT NULL,               -- Nome do filme
    fil_diretor VARCHAR(150),                     -- Diretor do filme
    fil_duracao INT,                              -- Duração do filme em minutos
    fil_dtlancamento DATE,                        -- Data de lançamento
    fil_sinopse text,							  -- Sinopse do Filme
    fil_capa varchar (255),						  -- Capa do Filme
    FOREIGN KEY (genero_filme_id) REFERENCES genero(gen_id) -- Chave estrangeira para gênero
);

-- Tabela de livros
CREATE TABLE livros (
    liv_id INT AUTO_INCREMENT PRIMARY KEY,        -- Chave primária
    genero_livro_id INT,                          -- Gênero do livro
    liv_nome VARCHAR(150) NOT NULL,               -- Nome do livro
    liv_escritor VARCHAR(150),                    -- Autor do livro
    liv_paginas INT,                              -- Número de páginas
    liv_dtlancamento DATE,                        -- Data de lançamento
    liv_sinopse text,
    liv_capa varchar(255),
    FOREIGN KEY (genero_livro_id) REFERENCES genero(gen_id) -- Chave estrangeira para gênero
);

-- Tabela de avaliações
CREATE TABLE avaliacao (
    aval_id INT AUTO_INCREMENT PRIMARY KEY,       -- Chave primária
    usuario_id INT,                               -- Usuário que avaliou
    filme_id INT,                                 -- Filme avaliado (pode ser NULL se for livro)
    livro_id INT,                                 -- Livro avaliado (pode ser NULL se for filme)
    aval_nota INT NOT NULL,                       -- Nota da avaliação
    aval_texto TEXT,                    		  -- Texto/opinião
    aval_data TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, -- Data da avaliação
    FOREIGN KEY (usuario_id) REFERENCES usuario(user_id),   -- FK para usuário
    FOREIGN KEY (filme_id) REFERENCES filmes(fil_id),       -- FK para filme
    FOREIGN KEY (livro_id) REFERENCES livros(liv_id)        -- FK para livro
);

select * from filmes;

INSERT INTO livros ( liv_id, genero_livro_id, liv_nome, liv_escritor, liv_paginas, liv_dtlancamento, liv_sinopse, liv_capa ) VALUES

(42, 1, 'Attack on Titan', 'Hajime Isayama', 400, '2009-09-09', 'A humanidade está à beira da extinção, encurralada por gigantes devoradores de homens conhecidos como Titãs. Vivendo cercada por enormes muralhas, a civilização luta para sobreviver. Quando um Titã colossal destrói a muralha externa, Eren Yeager e seus amigos juram vingança e se juntam à Tropa de Exploração. A medida que enfrentam batalhas brutais, segredos sombrios sobre os Titãs e a própria humanidade vêm à tona.', 'C:\\Users\\marya\\Downloads\\teste\\imagens\\attack.jpg'),


(43, 1, 'Jujutsu Kaisen', 'Gege Akutami', 360, '2018-03-05', 'Yuji Itadori é um estudante colegial com habilidades físicas excepcionais que se envolve com o mundo das maldições após engolir um objeto amaldiçoado: o dedo de Ryomen Sukuna, o rei das maldições. Ele se junta à Escola Técnica de Jujutsu para aprender a controlar suas habilidades recém-descobertas e combater entidades malignas que ameaçam a humanidade. Cheio de batalhas intensas, estratégias sobrenaturais e dilemas morais, Jujutsu Kaisen combina ação frenética com profundidade emocional.', 'C:\\Users\\marya\\Downloads\\teste\\imagens\\jujutsu.jpeg'),


(44, 1, 'Chainsaw Man', 'Tatsuki Fujimoto', 300, '2018-12-03', 'Denji é um jovem que vive em extrema pobreza, tentando pagar a dívida de seu falecido pai com a yakuza. Ao lado de seu fiel demônio-serra elétrica Pochita, ele caça demônios para sobreviver. Após ser traído e morto, Denji faz um pacto com Pochita e renasce como o híbrido Chainsaw Man. Ele é recrutado pela Segurança Pública e mergulha em um mundo brutal onde lida com inimigos cruéis, aliados misteriosos e uma luta constante por sua humanidade.', 'C:\\Users\\marya\\Downloads\\teste\\imagens\\chainsaw.jpeg'),


(23, 2, 'O Diário de Anne Frank', 'Anne Frank', 283, '1947-06-25', 'O retrato da menina por trás do mito. A única edição autorizada pelo Anne Frank Fonds.\nO diário de Anne Frank, o depoimento da pequena Anne, morta pelos nazistas após passar anos escondida no sótão de uma casa em Amsterdã, ainda hoje emociona leitores no mundo inteiro. Suas anotações narram os sentimentos, os medos e as pequenas alegrias de uma menina judia que, como sua família, lutou em vão para sobreviver ao Holocausto.', 'C:\\Users\\marya\\Downloads\\teste\\imagens\\diario.jpg'),


(25, 2, 'O Sol é para Todos', 'Harper Lee', 336, '1960-07-11', 'Um livro emblemático sobre racismo e injustiça: a história de um advogado que defende um homem negro acusado de estuprar uma mulher branca nos Estados Unidos dos anos 1930 e enfrenta represálias da comunidade racista.', 'C:\\Users\\marya\\Downloads\\teste\\imagens\\o-sol.jpeg'),


(45, 2, 'Your Lie in April', 'Naoshi Arakawa', 300, '2011-04-06', 'Kousei Arima é um prodígio do piano que perde a capacidade de ouvir sua própria música após a morte de sua mãe, mergulhando em um mundo cinza e silencioso. Sua vida muda quando conhece Kaori Miyazono, uma violinista vibrante e cheia de energia.', 'C:\\Users\\marya\\Downloads\\teste\\imagens\\your-lie.jpeg'),


(39, 3, 'Solo Leveling', 'Chugong', 270, '2016-03-04', 'Em um mundo onde portais conectam a realidade a masmorras cheias de monstros, alguns humanos despertam poderes e tornam-se caçadores. Sung Jin-Woo é conhecido como o mais fraco de todos os caçadores, mas sobrevive a uma dungeon dupla e recebe um misterioso sistema.', 'C:\\Users\\marya\\Downloads\\teste\\imagens\\solo-leveling.jpg'),


(40, 3, 'The Beginning After The End', 'TurtleMe', 320, '2018-12-20', 'O poderoso rei Grey reencarna como Arthur Leywin em um mundo de magia. Com uma nova chance, ele enfrenta desafios mágicos e políticos, enquanto busca equilíbrio, amor e propósito.', 'C:\\Users\\marya\\Downloads\\teste\\imagens\\the-beginning.jpeg'),


(41, 3, 'Frieren: Beyond Journey’s End', 'Kanehito Yamada', 280, '2020-04-28', 'Após a derrota do Rei Demônio, a elfa maga Frieren embarca em uma jornada para compreender melhor os sentimentos humanos. Uma reflexão sobre o tempo, amizade e arrependimento.', 'C:\\Users\\marya\\Downloads\\teste\\imagens\\frieren.jpeg'),


(46, 4, 'Kaguya-sama: Love is War', 'Aka Akasaka', 260, '2015-05-19', 'Kaguya e Miyuki, estudantes geniais, lutam em batalhas psicológicas para forçar o outro a se declarar primeiro. Uma comédia romântica recheada de estratégias e mal-entendidos.', 'C:\\Users\\marya\\Downloads\\teste\\imagens\\kaguya.jpeg'),


(47, 4, 'Gintama', 'Hideaki Sorachi', 500, '2003-12-08', 'Em um Japão feudal dominado por alienígenas, Gintoki Sakata enfrenta missões absurdas com humor, ação e muita paródia. Um mangá imprevisível e hilário.', 'C:\\Users\\marya\\Downloads\\teste\\imagens\\gintama.jpg'),


(48, 4, 'O Guia do Mochileiro das Galáxias', 'Douglas Adams', 224, '1979-10-12', 'Arthur Dent escapa da destruição da Terra e viaja pelo espaço com um livro chamado \"O Guia do Mochileiro das Galáxias\". Uma sátira da ficção científica com humor britânico.', 'C:\\Users\\marya\\Downloads\\teste\\imagens\\guia.jpeg'),


(32, 5, 'Drácula', 'Bram Stoker', 418, '1897-05-26', 'O Conde Drácula tenta se mudar para a Inglaterra. Através de diários e cartas, um grupo tenta detê-lo. Um clássico do horror e gótico.', 'C:\\Users\\marya\\Downloads\\teste\\imagens\\dracula.jpeg'),


(33, 5, 'Frankenstein', 'Mary Shelley', 280, '1818-01-01', 'Victor Frankenstein dá vida a uma criatura feita de cadáveres. Rejeitado, o monstro busca vingança. Uma obra sobre ambição, solidão e responsabilidade.', 'C:\\Users\\marya\\Downloads\\teste\\imagens\\Frankenstein.jpg'),


(49, 5, 'Tomie', 'Junji Ito', 380, '1987-06-07', 'Tomie é uma bela jovem imortal que causa obsessão e morte por onde passa. Um terror psicológico e corporal intenso de Junji Ito.', 'C:\\Users\\marya\\Downloads\\teste\\imagens\\tomie.jpg'),


(19, 6, 'O Único Destino dos Vilões é a Morte', 'Gwon Gyeoeul', 380, '2020-01-01', 'Reencarnada como vilã em um jogo, Penelope precisa conquistar um dos cinco protagonistas para evitar sua morte. Uma história de recomeços e escolhas.', 'C:\\Users\\marya\\Downloads\\teste\\imagens\\Destino_viloes.jpeg'),


(37, 6, 'Ao Haru Ride', 'Io Sakisaka', 250, '2011-01-13', 'Futaba tenta mudar sua vida no colégio e reencontra seu antigo amor, Kou, agora com outro nome. Um romance sobre mudanças e amadurecimento.', 'C:\\Users\\marya\\Downloads\\teste\\imagens\\ao-haru-ride.jpg'),


(38, 6, 'Given', 'Natsuki Kizu', 220, '2013-04-30', 'Ritsuka reencontra o amor e a paixão pela música ao conhecer Mafuyu. Juntos, com uma banda, enfrentam dores do passado e descobrem novos sentimentos.', 'C:\\Users\\marya\\Downloads\\teste\\imagens\\given.jpg')
;

INSERT INTO filmes (fil_id, genero_filme_id, fil_nome, fil_diretor, fil_duracao, fil_dtlancamento, fil_sinopse, fil_capa) VALUES 

(19, 1, 'Vingadores: Ultimato', 'Anthony e Joe Russo', 181, '2019-04-25', 'Após os eventos devastadores de ''Guerra Infinita'', Após os devastadores eventos de Vingadores: Guerra Infinita, onde o vilão Thanos eliminou metade de toda a vida no universo com um estalar de dedos usando as Joias do Infinito, os poucos heróis restantes enfrentam um mundo em ruínas e um futuro incerto. Com Tony Stark desaparecido e Steve Rogers liderando um grupo dividido, eles precisam superar suas diferenças e reunir forças para encontrar uma maneira de reverter o genocídio cósmico.a envolve viagens no tempo por diferentes momentos da história dos heróis, resgatando fragmentos do passado para juntar as Joias do Infinito novamente. Essa missão coloca os Vingadores em confrontos épicos, sacrifícios pessoais e decisões difíceis, culminando em uma batalha final de proporções gigantescas contra Thanos e seu exército, onde o destino do universo inteiro está em jogo.', 'C:\Users\marya\Downloads\teste\imagens\vingadores.jpg'),


(20, 1, 'Mad Max: Estrada da Fúria', 'George Miller', 120, '2015-05-14', 'Em um futuro pós-apocalíptico, onde a civilização entrou em colapso e a água e a gasolina são recursos escassos, Max Rockatansky — um ex-policial solitário — é capturado por uma gangue liderada pelo tirano Immortan Joe. Max acaba se unindo à Imperatriz Furiosa, uma guerreira rebelde que trai Joe ao fugir com suas cinco esposas, mulheres mantidas em cativeiro para reprodução.
Juntos, Max, Furiosa e as mulheres embarcam em uma intensa e explosiva perseguição pelo deserto em busca de liberdade e redenção. Ao longo do caminho, enfrentam veículos de guerra, tempestades de areia e batalhas alucinantes, em um mundo onde apenas os mais fortes sobrevivem.
', 'C:\Users\marya\Downloads\teste\imagens\mad.jpg'),

(21, 1, 'John Wick', 'Chad Stahelski', 101, '2014-10-24', 'John Wick, um lendário ex-assassino de aluguel, está de luto após a morte de sua esposa. Como último gesto de amor, ela lhe deixa um filhote de cachorro para ajudá-lo a lidar com a dor. No entanto, sua paz é brutalmente destruída quando um grupo de criminosos invade sua casa, rouba seu carro e mata seu cachorro.
Movido pela dor e pelo desejo de vingança, John volta ao submundo do crime que havia deixado para trás. Agora, ele enfrenta mafiosos perigosos, velhos aliados e uma cidade inteira de assassinos profissionais enquanto busca justiça com determinação implacável — e muitas balas.', 'C:\Users\marya\Downloads\teste\imagens\john.jpg'),


(22, 2, 'À Procura da Felicidade', 'Gabriele Muccino', 117, '2006-12-15', 'Baseado em uma história real, o filme acompanha Chris Gardner, um vendedor batalhador que enfrenta sérias dificuldades financeiras enquanto tenta cuidar de seu filho pequeno após ser abandonado pela esposa. Sem dinheiro, sem emprego fixo e eventualmente sem teto, Chris luta todos os dias para dar uma vida digna ao filho.
Quando consegue uma vaga como estagiário em uma prestigiada corretora de valores, mesmo sem salário garantido, ele vê a chance de mudar seu destino. Com esforço, inteligência e muita perseverança, Chris enfrenta todos os obstáculos em busca de uma vida melhor não só para ele, mas principalmente para seu filho.
', 'C:\Users\marya\Downloads\teste\imagens\procura.jpg'),


(23, 2, 'O Curioso Caso de Benjamin Button', 'David Fincher', 166, '2008-12-25', 'Benjamin Button nasce em condições incomuns: com aparência e doenças de um idoso, mesmo sendo um recém-nascido. Abandonado pelo pai e criado por uma cuidadora em um asilo, ele começa a rejuvenescer com o passar dos anos, vivendo sua vida ao contrário envelhecendo para trás.
À medida que Benjamin cresce e rejuvenesce, ele enfrenta desafios únicos, conhece o amor da sua vida, Daisy, e lida com a passagem do tempo de forma totalmente diferente das outras pessoas. Uma história comovente sobre o amor, a perda, o tempo e a efemeridade da vida.', 'C:\Users\marya\Downloads\teste\imagens\curioso.jpg'),


(24, 2, 'Forrest Gump', 'Robert Zemeckis', 142, '1994-07-06', 'Forrest Gump é um homem simples e gentil do Alabama com um QI abaixo da média, mas com um coração imenso. Apesar das limitações, ele vive uma vida extraordinária, participando de momentos marcantes da história dos Estados Unidos desde a Guerra do Vietnã até eventos políticos e culturais importantes sem sequer perceber sua relevância.
Com uma fé inabalável no amor por Jenny, sua amiga de infância, e com o apoio de sua mãe, Forrest percorre a vida com pureza, coragem e inocência, mostrando que não é preciso ser um gênio para fazer grandes coisas. Uma história emocionante sobre superação, amor e o impacto que uma única vida pode ter no mundo.', 'C:\Users\marya\Downloads\teste\imagens\Forrest.jpg'),


(25, 3, 'Harry Potter', 'Chris Columbus', 152, '2001-11-23', 'Harry Potter é um garoto órfão que vive com os tios abusivos e não sabe nada sobre seu passado. No dia de seu 11º aniversário, ele descobre que é um bruxo e que foi aceito para estudar na Escola de Magia e Bruxaria de Hogwarts. Lá, ele faz amizades com Ron e Hermione, e começa a aprender sobre o mundo mágico.
Logo, Harry descobre que é famoso por ter sobrevivido ao ataque do terrível bruxo Voldemort quando era apenas um bebê. Ao longo do ano letivo, ele se envolve em uma misteriosa trama envolvendo uma pedra mágica que dá imortalidade a Pedra Filosofal e se depara com os primeiros sinais do retorno das forças das trevas.', 'C:\Users\marya\Downloads\teste\imagens\harry.jpg'),


(26, 3, 'Senhor dos Anéis', 'Peter Jackson', 178, '2001-12-19', 'Em um mundo fantástico chamado Terra-média, um antigo e poderoso anel ressurge e ameaça mergulhar tudo nas trevas. O jovem hobbit Frodo Bolseiro herda o anel e descobre que ele deve ser destruído para evitar que o maligno Sauron retorne ao poder.
Para isso, uma sociedade formada por nove companheiros incluindo hobbits, humanos, um mago, um elfo e um anão parte em uma perigosa jornada até a Montanha da Perdição, o único lugar onde o anel pode ser destruído. Pelo caminho, eles enfrentam monstros, traições e grandes batalhas, enquanto a sombra do mal se espalha.', 'C:\Users\marya\Downloads\teste\imagens\senhor.jpg'),


(27, 3, 'Alice no País das Maravilhas', 'Tim Burton', 108, '2010-04-21', 'Alice Kingsleigh, agora com 19 anos, é uma jovem curiosa e sonhadora que se sente deslocada no mundo real. Durante uma festa da aristocracia vitoriana, ela segue um coelho de colete e relógio e acaba caindo em um buraco que a leva ao País das Maravilhas um mundo mágico e estranho que ela havia visitado quando criança, mas havia esquecido.
Lá, Alice reencontra personagens icônicos como o Chapeleiro Maluco, a Rainha Branca, a Rainha Vermelha e o Gato Risonho. Com coragem e determinação, ela descobre que seu destino é enfrentar o temido Jabberwocky e restaurar a paz no reino, redescobrindo sua própria força e identidade no processo.', 'C:\Users\marya\Downloads\teste\imagens\alice.jpg'),


(28, 4, 'Superbad', 'Greg Mottola', 113, '2007-08-17', 'Evan e Seth são dois adolescentes inseparáveis que estão prestes a se formar no colégio e entrar para a faculdade. Inseguros e socialmente deslocados, eles querem aproveitar ao máximo os últimos momentos antes de seguirem caminhos diferentes e, claro, tentar finalmente impressionar as garotas dos seus sonhos.
Quando surge a oportunidade de comprar bebidas para uma festa, eles veem nisso a chance perfeita de se tornarem populares. Mas nada sai como o planejado, e a noite se transforma em uma sequência hilária de contratempos, encontros esquisitos e situações embaraçosas. Com a ajuda do excêntrico amigo Fogell (também conhecido como ''McLovin''), os três embarcam numa aventura caótica e inesquecível.', 'C:\Users\marya\Downloads\teste\imagens\bad.jpg'),


(29, 4, 'Se Beber, Não Case!', 'Todd Phillips', 100, '2009-06-05', 'Quatro amigos viajam para Las Vegas para celebrar a despedida de solteiro de Doug. Eles planejam uma noite épica, mas acordam no dia seguinte em um quarto de hotel completamente destruído sem se lembrar de nada do que aconteceu. Pior: Doug desapareceu, e o casamento está prestes a acontecer em poucas horas.
Completamente perdidos, Phil, Stu e Alan tentam reconstruir os eventos da noite anterior para encontrar o noivo. No caminho, eles se deparam com situações absurdas, incluindo um tigre no banheiro, um bebê misterioso, um traficante perigoso e até Mike Tyson. Uma comédia insana sobre amizade, irresponsabilidade e consequências.', 'C:\Users\marya\Downloads\teste\imagens\beber.jpg'),


(30, 4, 'A Mentira', 'Will Gluck', 92, '2010-09-17', 'Olive Penderghast é uma estudante do ensino médio comum que, após uma pequena mentira sobre sua vida amorosa se espalhar pela escola, vê sua reputação mudar da noite para o dia. Aproveitando-se da fama repentina, ela decide assumir a imagem de “garota má” da escola mas tudo isso tem um preço.
Inspirando-se em “A Letra Escarlate”, livro que está estudando na aula de literatura, Olive passa a costurar um “A” vermelho nas suas roupas, em referência à personagem do romance. No entanto, conforme as mentiras aumentam e fogem do controle, ela precisa decidir quem realmente quer ser e como recuperar sua reputação.', 'C:\Users\marya\Downloads\teste\imagens\mentira.jpg'),


(31, 5, 'Invocação do Mal', 'James Wan', 112, '2013-07-19', 'Baseado em fatos reais, o filme acompanha os renomados investigadores paranormais Ed e Lorraine Warren, que são chamados para ajudar a família Perron. Eles acabaram de se mudar para uma casa de fazenda isolada em Rhode Island e começam a vivenciar eventos assustadores e inexplicáveis.
À medida que a atividade sobrenatural se intensifica, os Warren descobrem que a casa tem um passado sombrio e está sob a influência de uma entidade demoníaca. Enfrentando forças malignas poderosas, o casal de investigadores luta para salvar a família e sobreviver ao caso mais aterrorizante de suas vidas.
', 'C:\Users\marya\Downloads\teste\imagens\mal.jpg'),


(32, 5, 'O Exorcista', 'William Friedkin', 122, '1973-12-26', 'Quando a jovem Regan MacNeil começa a apresentar comportamentos estranhos e perturbadores incluindo violência, linguagem obscena e forças sobrenaturais sua mãe, desesperada, recorre a médicos e psiquiatras, mas nenhum tratamento funciona.
Sem saída, ela procura a ajuda da Igreja, e dois padres são designados para investigar o caso: o experiente Padre Merrin e o inseguro Padre Karras. Juntos, eles enfrentam uma entidade demoníaca poderosa e aterradora em um ritual de exorcismo que colocará à prova sua fé, coragem e sanidade.
Considerado um dos filmes mais assustadores de todos os tempos, O Exorcista é um marco do cinema de terror.', 'C:\Users\marya\Downloads\teste\imagens\exorcista.png'),


(33, 5, 'It: A Coisa', 'Andy Muschietti', 135, '2017-09-07', 'Na pacata cidade de Derry, crianças começam a desaparecer misteriosamente. Um grupo de garotos autodenominado Clube dos Otários se une para investigar os desaparecimentos e acaba enfrentando seus piores pesadelos na forma de Pennywise, um palhaço demoníaco e assassino.
A entidade, que desperta a cada 27 anos para se alimentar do medo (e das crianças), se infiltra nos traumas e inseguranças de cada um. Unidos pela amizade, coragem e lealdade, os jovens precisarão enfrentar seus medos mais profundos para tentar derrotar esse mal ancestral.
', 'C:\Users\marya\Downloads\teste\imagens\it.jpg'),


(34, 6, 'Diário de uma Paixão', 'Nick Cassavetes', 123, '2004-06-25', 'Em um asilo, um senhor chamado Duke lê uma história de amor de um velho caderno para uma mulher com Alzheimer. A narrativa acompanha Allie Hamilton e Noah Calhoun, dois jovens de classes sociais diferentes que se apaixonam intensamente durante um verão nos anos 1940.
Separados pelas circunstâncias e pela oposição da família de Allie, eles seguem caminhos distintos. Mas o sentimento entre eles nunca desaparece. Anos depois, já adultos, o destino os reúne novamente e os sentimentos ressurgem com força total. Uma história comovente sobre amor verdadeiro, escolhas e o poder da memória.', 'C:\Users\marya\Downloads\teste\imagens\paixao.jpg'),


(35, 6, 'Orgulho e Preconceito', 'Joe Wright', 129, '2005-11-11', 'Na Inglaterra do século XIX, Elizabeth Bennet é uma jovem inteligente, espirituosa e de opinião forte, que vive com suas quatro irmãs em uma família de classe média. Quando o rico e reservado Sr. Darcy chega à região, a convivência entre os dois começa com desconfiança, julgamentos e... orgulho e preconceito de ambos os lados.
Ao longo do tempo, Elizabeth e Darcy precisam confrontar seus próprios erros de julgamento, o peso das convenções sociais e os sentimentos que começam a surgir entre eles. Uma história atemporal sobre amor, orgulho, classe social e transformação pessoal.', 'C:\Users\marya\Downloads\teste\imagens\orgulho.jpg'),


(36, 6, 'Titanic', 'James Cameron', 195, '1997-12-19', 'Em 1912, o luxuoso transatlântico RMS Titanic parte em sua viagem inaugural, carregando passageiros de diferentes classes sociais. A bordo, a jovem aristocrata Rose DeWitt Bukater, noiva de um rico empresário, conhece Jack Dawson, um artista pobre e aventureiro que ganhou a passagem em um jogo de cartas.
Apesar das diferenças, os dois se apaixonam profundamente durante a viagem. No entanto, seu romance é interrompido pela tragédia quando o navio colide com um iceberg e começa a afundar. Entre o caos e a luta pela sobrevivência, Jack e Rose vivem um amor intenso, inesquecível e marcado pela perda.', 'C:\Users\marya\Downloads\teste\imagens\titanic.jpg')

;

SET SQL_SAFE_UPDATES = 1;

select * from filmes;

UPDATE filmes
SET fil_capa = REPLACE(fil_capa, 'Downloads\\teste\\imagens', 'Downloads\\Finalizado\\imagens')
WHERE fil_capa LIKE '%Downloads\\teste\\imagens%';

UPDATE filmes
SET fil_capa = 'C:\\Users\\marya\\Downloads\\Finalizado\\imagens\\exorcista.jpg'
WHERE fil_id = 1;

select * from livros;

UPDATE livros
SET liv_capa = 'C:\\Users\\marya\\Downloads\\Finalizado\\imagens\\destino.jpg'
WHERE liv_id = 19;