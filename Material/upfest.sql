-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Tempo de geração: 01-Set-2023 às 08:43
-- Versão do servidor: 11.0.2-MariaDB
-- versão do PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `upfest`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `artista`
--

CREATE TABLE `artista` (
  `id` int(11) NOT NULL,
  `evento` int(11) NOT NULL,
  `nome` text DEFAULT NULL,
  `estilo` text DEFAULT NULL,
  `biografia` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Extraindo dados da tabela `artista`
--

INSERT INTO `artista` (`id`, `evento`, `nome`, `estilo`, `biografia`) VALUES
(7, 1, '999999999', 'Hard techno sem dó nem piedade', 'O duo italiano 999999999 é a mais pura representação do hard techno. Foi a sua poderosa combinação de acid techno, kicks estrondosos e hardcore de alto impacto que os transportou para a vanguarda do techno mundial. Vão marcar presença no Sónar Lisboa com a alta intensidade e impacto da sua atuação ao vivo, onde exploram uma mesa cheia de hardware para criar uma onda de choque que faz estremecer o solo. Contem com o set de techno mais vigoroso e fisicamente envolvente que provavelmente terão oportunidade de testemunhar nos dias de hoje.'),
(8, 1, 'Acid Pauli', 'O viajante incansável da dance music', 'Como Acid Pauli, Martin Gretschmann explora a vertente mais cósmica, psicadélica e aventureira da música de dança. Os seus sets híbridos – em galerias de arte contemporânea ou no Burning Man – testemunham a diversidade de influências e a sua musicalidade. É membro da banda The Notwist desde 2015, e já atuou nos cinco cantos do mundo, partilhando o palco com artistas como Damien Lazarus e a icónica cantora turca de pysch-folk Selda Bağcan. O próximo passo na sua contínua viagem: Sónar Lisboa 2023.'),
(9, 1, 'Amelie Lens', 'Techno sem rodeios', 'Amelie Lens sabe como encher uma sala. A abordagem ácida e sem rodeios da artista belga colocou-a na vanguarda da cena techno contemporânea. A sua atenção obsessiva ao detalhe e uma ética de trabalho stakhanovista levaram-na do meio de uma multidão no Dour Festival - onde, aos 15 anos de idade, se apaixonou pelo género - até os maiores palcos do mundo. Em 2023, está melhor que nunca, com a sua EXHALE a trazer-lhe o reconhecimento merecido como diretora de uma label, curadora de rádio e promotora de eventos. Isto tudo para além do seu trabalho como DJ e produtora. Respira fundo, porque a sua aparição no Sónar Lisboa promete ser uma experiência intensa.'),
(10, 1, 'Amulador', 'Techno hipnótico por um dos mais consistentes DJs nacionais', 'O projecto Amulador de Pedro Rodrigues começa difuso, longe dos holofotes, mas é tão marcante que se entranhou e confunde com o universo da música de dança em Portugal. Depois de décadas a fazer dançar como parte do duo Freshkitos, uma aventura a solo era mais que expectável, e com ela vieram iniciativas como Gare Porto, Orpheu e Alice. O techno groovy e hipnótico alicerçado em ambiências profundas mas que não ignora a riqueza rítmica dos tempos clássicos dos anos 90 e 2000 é a imagem de marca de Amulador, uma figura omnipresente na electrónica nacional e um dos mais consensuais DJs do país.'),
(11, 1, 'Ana Pacheco', 'Uma aventura pelos limites da música electrónica', 'A diversidade está no centro de tudo o que a Ana Pacheco faz. Para além do seu trabalho como DJ, apresentadora de rádio e promotora, é também criadora de cabras e psicóloga, e o seu gosto musical é igualmente eclético. Desde os primórdios da electrónica e do trance hipnótico até ao pós-punk e electro mais excêntricos, os seus sets levam a pista de dança numa aventura desenfreada pelos limites da música electrónica. Apareçam, sintonizem-se e deixem tudo para ouvir o seu set no Sónar Lisboa.'),
(12, 1, 'Anfisa Letyago', 'A estrela em mais rápida ascensão do Techno', 'Nos últimos três anos, Anfisa Letyago passou por uma metamorfose que a transformou num dos maiores nomes do techno moderno. Dando os seus primeiros passos nos clubes e pistas de dança da sua cidade natal de Nápoles, aperfeiçoou a sua própria linha de deep techno onde assume o groove como principal força motriz, tanto enquanto DJ como produtora (com lançamentos nas afamadas Drumcode e Kompakt, para além da sua própria label, N:S:DA). Depois de um set de encerramento inesquecível no Sónar Barcelona do ano passado, chega a Lisboa pronta para fazer estremecer as fundações do Pavilhão Carlos Lopes.'),
(13, 1, 'Astra Club (DJ Tennis b2b Carlita)', 'Sinfonias eletrónicas', 'Ele era manager de bandas punk, ela tem formação em música clássica. Juntos, DJ Tennis e Carlita, são o Astra Club, uma exploração da música electrónica no seu estado mais sinfónico. Ambos partilham um vasto gosto musical, cheio de particularidades, e os seus sets têm a capacidade de, simultaneamente, tocar corações e o céu. Uma dupla perfeita para o lineup da edição de 2023 do Sónar Lisboa.'),
(14, 1, 'Bawrut', 'Uma visão mediterrânica da pista de dança', 'Nascido em Itália mas atualmente a residir em Madrid, o produtor Bawrut é o chamado DJ dos DJs. Adotando o house de Chicago como ponto de partida, explora um pouco de tudo, do techno ao disco, e mais além, sempre com o ouvido cuidado de um selector experiente. Em vez de “baleárico”, prefere o termo “mediterrânico” - ouve o seu último álbum no Ransom Note - que serve como metáfora para a sua abordagem à música: um lugar onde várias culturas, estilos e sons se encontram, geralmente sob um céu azul.'),
(15, 1, 'Bernardo b2b Johan', 'Simbiótica minimal sedutiva', 'Bernardo e Johan são parceiros de longa data na Hubble Recordings e têm ambos uma afinidade comum pela subtileza da electrónica romena. A origem do seu fascínio tem raízes profundas, antigas, nas grandes bandas da electrónica como The Prodigy, The Chemical Brothers ou Underworld, mas tem um lado empírico, nocturno, próprio de quem sabe o que a pista precisa. Um minimalismo sedutor que se encontra na atitude discreta que adoptam e que é revelado quando se juntam na cabine, numa simbiose pouco comum. Dizem que não dançar os seus discos noite dentro é ser fora da lei, e nós acreditamos.'),
(16, 1, 'Catarina Silva', 'Nómada Musical', 'Catarina Silva é uma nómada musical que procura nas diferentes estéticas da electrónica uma eufonia. Partindo de uma ideia vincada de abstracção, Catarina converge emoções e simbolismo através de uma caprichosa e diversificada selecção, tendo conquistado desde o início da pandemia um espaço na cena nacional. Membro do colectivo “Dark Sessions” desde 2018, juntou-se recentemente ao projecto “Alínea A”.\r\n\r\nhttps://soundcloud.com/catarinasilva909'),
(17, 1, 'Chet Faker DJ set', 'Soul, jazz e música electrónica descontraída', 'A mistura de vocais emotivos e música electrónica descontraída do cantor e compositor australiano Chet Faker transportou-o para o estrelato há cerca de 10 anos atrás. Pouco depois, em 2016, substituiu o seu nome artístico de tom irónico pelo seu próprio nome, Nick Murphy. Mas em 2020, Chet Faker regressou, e vem agora ao Sónar Lisbon para um DJ set de domingo à tarde, onde vai explorar as suas diversas influências e gostos musicais, da electrónica alegre ao soul de coração partido ao jazz descontraído.'),
(18, 1, 'Cinthie live', 'House clássico com traços de modernidade', 'Cinthie é uma produtora e DJ de Berlim que presta homenagem às origens do house com as suas interpretações cruas, intensas e atuais deste género musical. Uma seguidora do house de Chicago, sem esquecer o techno de Detroit, nu-disco e UK bass. É uma DJ de renome, respeitada enquanto editora e proprietária de uma loja de discos. No Sónar Lisboa, a sua performance live irá incluir misturas de hardware para transformar elementos clássicos em novas e desafiantes sonoridades.'),
(19, 1, 'Colin Benders live', 'Mestre do sintetizador modular', 'A mestria de Colin Benders no seu instrumento de eleição - o sintetizador modular - confere-lhe a liberdade necessária para explorar os mais vastos e longínquos domínios da música electrónica. E fá-lo com uma alegria contagiante que tem alguma dificuldade em disfarçar. Do ambient reluzente ao techno pulsante, a incrível capacidade de improvisação deste compositor nascido em Utrecht faz com que nada fuja do seu alcance. Cada set não constitui apenas uma experiência auditiva, mas também um vislumbre do que se passa na mente criativa e singular de Benders.'),
(20, 1, 'Cormac b2b fka.m4a', 'Música de dança energética, eufórica e sensual', 'Dois dos selectors mais coloridos de Berlim vêm ao Sónar Lisboa. Ambos oriundos do Reino Unido, Cormac e fka.m4a conheceram-se no coração da party scene queer da capital alemã, unindo-se através da partilha de um amor pela música de dança enérgica, eufórica e lasciva: do Italo disco ao hi-NRG, passando pelos tons mais luminosos do house e do techno. Conhecidos pelas melhores razões na sua cidade natal adotada - são frequentadores assíduos do Berghain e do Panorama Bar - vão com certeza dar um toque sensual, cósmico e alegre ao Sónar by Night esta primavera.'),
(21, 1, 'Cruz', 'Um jovem veterano da música house', 'O longo trajecto de Cruz na música só tem paralelismo na jovialidade que apresenta. Discreto mas de reconhecida influência no mundo do house e suas variações, o responsável de Bloop Recordings é por hoje uma figura bastante requisitada, sendo normal vê-lo circular entre festivais e clubes por todo o país. Por força da sua abordagem singular à electrónica, troca com o público uma empatia contagiante, enquanto o atrai e manipula através do seu método de contacto favorito: o vinil. Cruz traz com ele bem mais do que uma década e promete oferecer-nos outra e outra, bem dançadas e bem vividas.'),
(22, 1, 'Diana Oliveira', 'Homenagem a Detroit', 'Residente no famoso Indústria Club do Porto, Diana Oliveira é uma discípula de Detroit dedicada. A sua mistura de techno e electro é suave e melódica, e impulsionada pela mesma alma mecânica que inspirou os pioneiros do género. Este ano vai trazer um gostinho de The Motor City para o Sónar by Day, com um set que demonstra que o 4 x 4 nunca sai de moda.'),
(23, 1, 'DJ MELL G', 'Dura, veloz e divertida', 'DJ MELL G especializa-se em música dura, veloz e divertida. Sendo uma quase residente da rádio HÖR - a casa de banho mais famosa de Berlim - os seus sets incorporam uma série de géneros, sempre com um ouvido apurado para sons altamente enérgicos e eufóricos. Tendo surgido da cena DIY, defende a música que ama através da sua própria label, a Juicy Gang Records, onde colabora com a lenda do ghettotech DJ Godfather e o agitador DJ Fuckoff. É essa mesma energia e entusiasmo que vai trazer para a pista no Sónar Lisboa.'),
(24, 1, 'DJ Nigga Fox live', 'Electrónica percussiva e psicadélica', 'Figura máxima da fusão entre a música da diáspora nacional e a electrónica contemporânea, DJ Nigga Fox representa uma vaga de artistas portugueses muito particular. Pegando na música de rua de influência suburbana e na ligação entre África, Portugal e a Europa, Nigga Fox abriu caminho a uma nova sonoridade onde a liberdade do ritmo exuberante e cru da batida encontra o psicadelismo experimental da composição avant-garde.\n\nEssa visão vanguardista ajudou a colocar Lisboa e o projecto Príncipe Records no radar como um dos fenómenos mais excitantes da música de dança na última década, facto que não escapou à lendária Warp Records e ao projecto Sónar, que o convidou a actuar na edição de Barcelona em 2021.'),
(25, 1, 'Enrico Sangiuliano', 'Peerless, timeless techno', 'O som de Enrico Sangiuliani é produzido no estúdio, mas concebido na pista de dança. O estilo característico de deep techno infusionado com trance foi aprimorado pelo ex-engenheiro de som durante a sua experiência como DJ de “encerramento”, quando tocava nas primeiras horas do dia em raves na região de Emilia-Romagna, no seu país natal. Também canalizou essas memórias numa série de lançamentos estonteantes - tendo começado em 2016 com “X-Pollination” - que o tornaram no artista techno mais vendido do Beatport durante três anos consecutivos. Vem ao Sónar Lisboa como um dos maiores nomes do género, apresentando a sua mistura de techno intemporal e sound design de precisão.'),
(26, 1, 'Entangled Others &amp; Clothilde present ‘Sediment Nodes’', 'Interconexões invisíveis', 'Sob o nome Entangled Others, o artista generativo Feileacan McCormick e a artista neural Sofia Crespo exploram a interconectividade e a nossa relação complexa com o mundo não humano. No contexto do Sónar+D Lisboa 2023, trazem até à exuberante Estufa Fria a sua exposição “Sediment Nodes”. Ecrãs colocados dentro da estufa - entre mais de 300 espécies diferentes de plantas - projetam imagens ampliadas de águas carregadas de sedimentos que exibem a variedade colorida de vida que existe dentro destas zonas aquáticas enlameadas, convidando o espectador a considerar a profundidade e a amplitude da vida interconectada que existe em todo o mundo. Para esta instalação, o Sónar+D Lisboa encomendou à artista local, e autora de música experimental, Clothilde, uma nova banda sonora criada em resposta à peça, criada com recurso à sua coleção de tecnologias modulares caseiras.'),
(27, 1, 'Folamour A/V show', 'Uma celebração vibrante da house music', 'A celebração extasiante da house music do Folamour chega ao Sónar Lisboa 2023. O francês passou o último ano a estabelecer-se como DJ e performer, caracterizado por uma força imparável e singular que irá expressar num espetáculo AV no Pavilhão Carlos Lopes. Disco, funk e soul até ao house clássico – prepara-te para um ambiente que fomenta positividade, união e dança constante.'),
(28, 1, 'Francisca Urbano', 'Uma apaixonada agitadora da pista de dança', 'Francisca Urbano tem uma história curta mas intensa no mundo da música nacional. Dona de um bom gosto transversal, mistura géneros díspares com a destreza de quem faz o que ama e com a paixão de quem quer mudar paradigmas. A colaboradora do projecto Viseense “O GRAVE” age sob o lema de fazer dançar, independentemente da hora ou do local.\r\n\r\nhttps://soundcloud.com/francisca-urbano'),
(29, 1, 'Funkamente', 'Globalmente funky', 'Dúo de melómanos unidos através do seu amor pelo funk proveniente de todas as partes do mundo, os Funkamente viram a sua paixão evoluir e tomar a forma de duas residências bimensais - no Lux Frágil, em Lisboa, e no Passos Manuel, no Porto -, uma label própria e datas por toda a Europa. No Sónar Lisboa vão abrir a sua enciclopédia para tocar um set diurno cheio de sol, brilho e grooves irresistíveis que prometem levantar o ânimo e fazer mexer os pés de todos os presentes.'),
(30, 1, 'GLOR1A presents ‘I Choose Not To Die’', 'GLOR1A presents ‘I Choose Not To Die’ featuring Frances Adair', '“I Choose Not To Die” é um espetáculo musical inovador ao vivo criado pela artista de R&B afrofuturista Glor1a. Com base nos temas - identidades digitais, vigilância e interação humano-tecnologia - que abordou no seu aclamado EP de 2021 ‘METAL‘, a artista do Reino Unido utiliza a tecnologia de realidade aumentada (RA) desenvolvida pela artista e escultora canadiana Frances Adair para revestir as bases do seu espetáculo com um mundo digital ancestral. No ecrã são projetados códigos QR que permitem ao público participar no espetáculo através dos seus smartphones, derrubando as barreiras entre artista e público.'),
(31, 1, 'Héctor Oaks live', 'O techno mais insaciável', 'Depois da histórica “tinhas-mesmo-de-lá-estar” dupla com Richie Hawtin em 2022, um dos mais importantes artistas de techno volta ao Sónar Lisboa para um live set único. DJ residente no infame clube de Berlim, Herrensauna, e no icónico Bassiani, em Tblisi, os sets de Héctor Oaks são insaciáveis, brutais e eufóricos. Podes esperar tudo isso, quando ele levar o seu hardware até ao Pavilhão Carlos Lopes em 2023 para um live show especial.'),
(32, 1, 'I Hate Models - Sónar exclusive AV show', 'Visceral, envolvente techno e trance', 'O mais recente artista a emergir do obscuro techno francês, I Hate Models, passou mais de uma década a desenvolver a sua própria conceção deste género. Está confortável com ambientes que envolvem caves escuras e armazéns abandonados, e a sua música transforma-se de uma cacofonia industrial para um devaneio tipo trance, que muitas vezes acontece na mesma faixa. Para o Sónar Lisboa 2023, preparou um espetáculo especial A/V que irá mostrar a sua música numa vertente mais visceral, cinematográfica e arrebatadora.'),
(33, 1, 'James Holden live', 'O espírito mais inquieto da música eletrónica regressa', 'James Holden é um dos espíritos mais inquietos da música eletrónica. Quer seja nas suas explorações de pagan synth psychedelia ou divagações de folk-trance, a sua carreira percorreu um longo caminho desde o techno melódico dos seus primeiros trabalhos. Em 2023, regressa com “Imagine This Is A High Dimensional Space Of All Possibilities”, o seu primeiro álbum de longa duração num espaço de 7 anos. Holden descreve-o como o disco que o seu “eu” adolescente queria produzir, e que canaliza ecos reais e imaginários de raves, viajantes da nova era e a cultura das rádios pirata no Reino Unido. O live que acompanha este disco vai ser um deleite para os dançarinos e melómanos curiosos e de mente aberta que marcarem presença no Sónar Lisboa.'),
(34, 1, 'John Woods', 'Deep house bem viajado', 'Quando começou a misturar aos 17 anos de idade, John Woods provavelmente não esperava que a sua paixão o levasse a Ibiza, Dubai, Tulum e Miami. Depois de produzir os seus próprios eventos “Reborn” em Portugal, tornou-se DJ residente do Amnesia e da Cova Santa, na Ilha Branca, o que lhe abriu as portas para datas em vários locais de prestígio à volta do mundo. Os seus sets revelam os momentos mais marcantes da sua viagem e exploram um deep house diverso e descontraído que nunca falha.'),
(35, 1, 'King Kami', 'Club music turbulenta e dramática do underground lisboeta', 'Residente em Lisboa mas brasileira de corpo e alma, as misturas turbulentas de King Kami absorvem tudo, do funk carioca ao drum\'n\'bass e à club music desconstruída. Também é conhecida por explorar - tanto nas suas produções como nos seus sets - o som do tecnobrega, um género híbrido do norte do Brasil que utiliza samples dramáticos e românticos da música popular brasileira dos anos 80. Com uma nova residência no Musicbox, em Lisboa, e um punhado de datas pela Europa, anuncia-se como um nome a ter em conta no panorama fértil do underground lisboeta.'),
(36, 1, 'KiNK live', 'Um live performer incomparável', 'KiNK oferece uma das performances live mais dinâmicas e energéticas da música de dança, capaz de transformar as pistas num êxtase coletivo, por meio de cabos e teclados. Encaixa-se entre o house e o techno – mas onde, exatamente? – os seus sets são uma tentativa de recriar o som das raves da sua juventude na Bulgária e a diversão caótica que experienciou. Aperta o cinto, Sónar Lisboa.'),
(37, 1, 'Lady Shaka', 'Uma alegre celebração de ancestralidade e inclusão', 'Lady Shaka apoia tanto a ancestralidade como a inclusão na pista de dança. Com os seus sets vibrantes, a femme queen representa tanto as suas origens - afro-pacífica e maori - como a cultura queer, canalizando a energia física das suas ocupações anteriores como bailarina, coreógrafa e MC. Os seus sets incluem de tudo um pouco, desde o clássico house dos anos 90 a faixas experimentais de club music e hinos do trap, e apimentados com muitos dos seus edits exclusivos de temas do mundo pop, e mais além. O seu set no Sónar Lisboa vai ser uma alegre celebração de identidade e liberdade, musical e não só.'),
(38, 1, 'Luisa', 'Altruistic house from a local favourite', 'Luisa afirma que não vive sem música, seja de que género. Tem um fraco por jazz e pelo calor da brasilidade, mas é no House que se impõe e onde fez o circuito nacional prestar-lhe merecida atenção. Desde pequena levada por um amor maior ao fenómeno da música, foi como DJ que Luisa escolheu dar de volta todos os momentos de felicidade que sente a ouvir outros artistas e é no altruísmo da retribuição que reside a sua maior arma: o controlo da pista de dança.\r\n\r\nhttps://soundcloud.com/luisa-m-m'),
(39, 1, 'Madd Rod', 'Polivalência formada no caldeirão musical Lisboeta', 'Madd Rod é um produto do caldeirão musical Lisboeta: curioso, explorador, emocional. Ávido de construir um legado, o prolífico produtor muda-se de armas e bagagens para Berlim onde lança a sua editora Inner Shah Recordings e o primeiro álbum Dystopian Desert. A sua música mistura vários sub-géneros do house e do techno, chegando a apresentar momentos de psicadelismo muito próprios do Trance. Uma polivalência que é hoje imagem de marca de Rodrigo Pinheiro.'),
(40, 1, 'Major League DJz', 'Os melhores embaixadores musicais da África do Sul', 'Os irmãos Bandile e Banele Mbere representam a música da sua terra natal há mais de uma década, oscilando entre o kwaito, o afrobeats e o gqom. Mas é a promoção do amapiano - a variante descontraída e jazzística do house que surgiu no país nos últimos anos - com a qual estão mais associados. Trabalharam como poucos outros para promover o género, tanto através das suas produções próprias com influências do hip-hop, como pelas suas colaborações hábeis com artistas como Diplo, além de promoverem novos talentos através da sua Balcony Mix series e o seu festival Major League Gardens. Estendam o tapete vermelho no Sónar Lisboa para dois dos melhores embaixadores musicais da África do Sul.'),
(41, 1, 'Max Cooper live AV', 'Electronica cientificamente perfeita', 'A música de Max Cooper não desvenda o seu passado como cientista. É a atenção às pequenas coisas que se pode ouvir nas suas fascinantes e matematicamente perfeitas declinações do minimalismo clássico e da electrónica emocional, influenciada por Terry Riley e Philip Glass, Jon Hopkins e Aphex Twin. O artista audiovisual, com um doutoramento em biologia computacional, estreia-se no Sónar Lisboa 2023 com o seu impressionante espetáculo AV imersivo (termo que é utilizado indiscriminadamente, mas aqui é 100% válido), baseado no seu último álbum \"Unspoken Words\".'),
(42, 1, 'META AV (CLON + Ana Quiroga)', 'Uma viagem audiovisual com destino a uma realidade paralela', 'META AV é um espetáculo audiovisual imersivo criado com tecnologias de videojogos, da autoria da artista digital CLON (Estela Oliva), em colaboração com a compositora de música eletrónica Ana Quiroga. Inspirado por narrativas de ficção científica e uma estética cyberpunk, META AV convida o público a embarcar numa viagem com destino a uma realidade paralela, um mundo simulado repleto de imagens utópicas e distópicas. Apresentado em FPV (first-person view), o público experiencia o espetáculo a partir da perspetiva da personagem principal de um videojogo, com a banda sonora ao vivo de Ana Quiroga a conferir um toque sombrio de ambiente cinematográfico através de ritmos densos e vozes digitalmente processadas.'),
(43, 1, 'Mingote', 'Um activista da música de dança no interior', 'Natural da Covilhã mas de ouvidos postos no mundo, é assim Mingote. Ligado à música desde tenra idade, o jovem artista contribui hoje de forma dedicada e efectiva para a evolução e enraizamento da electrónica na sua cidade. Através do colectivo de artistas local Club Culture, e da sua residência no Companhia Club, Mingote tenta reunir o público em redor de um movimento num local onde a música de dança é praticamente inexistente. O co-fundador da editora Ovelha Trax, onde tem lançado os seus trabalhos, move-se essencialmente entre o breakbeat e o Detroit electro, sendo que é comum ouvi-lo salpicar as actuações com acid e techno.'),
(44, 1, 'Mochakk', 'House music com caráter', 'A única coisa que é comparável ao amor de Mochakk pela música house é a sua personalidade determinada e dedicação. Tem 22 anos e cresceu imerso na cultura skater e hip-hop, antes de descobrir a música electrónica. Atingiu o reconhecimento a nível global através de performances magnéticas e vários singles que se tornaram gigantes, incluindo um para a venerada editora Nervous Records de Nova Iorque. Ele vai mostrar o que o leva a ser uma das mais cintilantes estrelas de house no Sónar Lisboa 2023.'),
(45, 1, 'MVRIA', 'Uma verdadeira crente do underground português', 'Como programadora do Passos Manuel, um espaço independente, bar e cinema que é um dos segredos mais bem guardados do Porto, a MVRIA está profundamente ligada à cultura musical underground em Portugal, e é uma das principais ativistas a lutar por uma maior presença feminina. Os seus sets refletem a variedade de música que passa pelas portas do clube - variando entre tons mais escuros de disco, Hi-NRG, coldwave e synth pop, além de um Chicago house pulsante. Vem ouvir o verdadeiro som do underground português no Sónar Lisboa.'),
(46, 1, 'Nuno di Rosso', 'De agitador de pistas a DJ de rádio', 'Nuno di Rosso é um DJ de rádio. Mas é um DJ de rádio com inúmeras horas de experiência na cabine, graças a um longo percurso a tocar em clubes por Portugal afora. É simultaneamente um selector veterano e um agitador de pistas, com as suas misturas a incluírem electro, acid house, ghetto house, entre outros géneros, e a revelarem sempre um ou mais elementos totalmente inesperados. Vem experienciar uma viagem mental pela sua vasta e variada coleção de discos no Sónar by Day em Lisboa.'),
(47, 1, 'Or:la', 'A pista de dança descomplicada e apurada de uma das melhores DJs do Reino Unido', 'Se as misturas de Or:la parecem descomplicadas, é porque são exatamente isso. A partir da cidade que adotou como sua, Liverpool, a jovem DJ irlandesa, que é simultaneamente produtora e fundadora de uma editora, consolidou a reputação como uma das melhores DJs da atualidade (foi considerada pela DJMAG uma das melhores DJs do Reino Unido, no final de 2021), combinando UK bass sounds com breakbeat, classy techno e até um toque de deep house. Podes antecipar um set delicado, subtil e perfeitamente elaborado no Sónar Lisboa 2023.'),
(48, 1, 'Patrick Mason', 'O novo som do house e techno berlinense', 'Ícone de estilo, DJ, produtor, designer de moda, cineasta… Patrick Mason é uma das personalidades mais vibrantes da atualidade na cena house e techno. Oriundo da Bavária, faz parte de uma nova geração de DJs berlinenses moldada pelas suas experiências e encontros nas muitas pistas de dança da cidade, onde constroem pontes entre o passado e o presente da club culture. (A colaboração intergeracional de Mason com a referência berlinense Radio Slave, sob o nome SRVD, é um bom exemplo). Na cabine, o seu espírito de club kid vem ao de cima enquanto pousa, rodopia e desfila ao misturar de forma perfeita temas clássicos - a sua paixão pelo house de Chicago é evidente - com lançamentos new school. Um set sensacional está nas cartas para o Sónar by Night.'),
(49, 1, 'Peggy Gou', 'A ícone mais peculiar da club culture', 'Em 2023, Peggy Gou não é apenas uma das DJs mais bem sucedidas do mundo, mas também uma das caras mais conhecidas da club culture. No entanto, a sua curiosidade musical - que floresceu durante os seus anos de formação em Londres - permanece inalterada, mesmo depois da sua ascensão à fama e a sua crescente habilidade como DJ. Refere os pioneiros electrónicos japoneses Yellow Magic Orchestra e o produtor de culto do gay disco Patrick Cowley como as suas influências; e toca temas de labels como a Hessle Audio e a Hyperdub diante de milhares de pessoas com regularidade. O equilíbrio entre a sua capacidade de fazer vibrar uma sala de grandes dimensões e o seu ecletismo musical faz dela um headliner ideal para o Sónar Lisboa 2023.'),
(50, 1, 'Reinier Zonneveld live', 'Filth On Acid', 'A energia crua de um live de Reinier Zonneveld tem que ser experienciada, caso contrário ninguém acredita. Os live sets de acid techno do artista holandês têm uma intensidade sem paralelo, com kicks impiedosos e melodias esmagadoras a saírem da sua vasta panóplia de máquinas. A sua label Filth On Acid serve como veículo tanto para seus talentos como para os de outros - de Carl Cox a Speedy J - e uma descrição fiel do seu som. Cuidado Sónar Lisboa, que ele vem aí.'),
(51, 1, 'Rui Vargas b2b Gusta-vo', 'Dois ícones do underground português', 'Um par de DJs conhecidos pelas suas contribuições nos bastidores da cena portuguesa tocam back-to-back numa das sessões mais deep e inebriantes do festival. Não se pode contar a história da música electrónica em Portugal sem um capítulo sobre Rui Vargas, responsável por trazer o techno e o house até Lisboa com as suas noites num pequeno clube suado chamado Frágil. Hoje é o programador do Lux Frágil, o seu residente mais antigo e um venerado apresentador de rádio. Junta-se a ele Gustavo Pereira, aka Gusta-vo, um membro hiperativo da cena portuguesa - como DJ, promotor, manager e diretor criativo - desde o início dos anos 2000. Juntos, irão explorar os limites psicadélicos do house e do techno, assimilando o passado, o presente e o futuro.'),
(52, 1, 'Sensible Soccers', 'Heróis locais sem limites criativos', 'Numa época em que a velocidade das sociedades torna tudo tão efémero, os mais de 10 anos da banda Sensible Soccers parecem um feito. E são. Não é por obra do acaso que André Simão, Hugo Gomes e Manuel Justo se mantêm juntos há tanto tempo. Começam no caldo cultural das associações e passam por clubes, auditórios e festivais. Neles mostram a criatividade sem fronteiras de quem junta electrónica com instrumentação orgânica e as assenta orgulhosamente em melodias pop, conotação da qual não fogem e que os levou a marcos importantes, como actuar na primeira edição da Boiler Room em Portugal ou ver reconhecido o seu LP “8” como álbum do ano para a imprensa da especialidade. Recentemente aventuram-se com sucesso na composição para cinema e, com o apoio da Câmara Municipal do Porto, criam bandas sonoras originais para filmes do lendário realizador português Manoel de Oliveira.'),
(53, 1, 'Serginho b2b Zé Salvador', 'Lendas nacionais da música house', 'As carreiras musicais de Serginho e Zé Salvador entram já no campo do mito. Conhecidos de longa data e com um passado em comum no club Urbansound, no Porto, nos anos 90, partilham marcos históricos do House e uma visão de futuro do género em Portugal. A sonoridade de ambos é um ponto demasiado em comum para passar despercebida e a forma como se entendem e complementam depressa deixa visível a vasta experiência que possuem. Fazer dançar, sabendo de forma quase inconsciente qual o disco certo para o momento certo e o encadeamento capaz de levar o público ao êxtase pode parecer tarefa fácil, mas é a experiência ininterrupta desde o início do movimento até aos maiores festivais e clubs que lhes permite o estatuto de ícones da electrónica nacional.'),
(54, 1, 'Shaka Lion', 'Um artista global em constante evolução', 'Camaleónico, dinâmico, absorvente. Shaka Lion é um ser errante em permanente mutação e rodopio, um artista que mistura música com experiência de vida em partes iguais. Nascido no Brasil, criado no  Barreiro e abraçado por Lisboa, é vagueando pelo mundo que encontra similitudes e portos de abrigo musicais, juntando-se como radialista à reconhecida rádio londrina Rinse FM e como produtor e músico à editora de Los Angeles Soulection, que o leva em actuações pelos 4 cantos do mundo. O seu trajecto é curto mas sólido e os feitos assinaláveis: residências no MusicBox e no Lux Frágil, curadoria do Festival Iminente e colaborações com os músicos Sango e Smino.\nShaka Lion é ritmo e alegria. É sol da meia-noite e ballet durante a sesta. É o que se ouve e o que se vê.\n https://soundcloud.com/shaka-lion'),
(55, 1, 'SHERELLE x Kode9', 'Um caminho definido entre o Jungle e o Footwork', 'Duas gerações de club music britânica juntam-se para uma colaboração explosiva. SHERELLE faz parte de uma corrente de novos DJs que despertam o ritmo acelerado e frenético do jungle e drum\'n\'bass, misturando-o com os sons do footwork e juke de Chicago. Kode9 dispensa apresentações: fundador da icónica editora Hyperdub, passou duas décadas a explorar o que ele chama de \"hardcore continuum\", corrente musical que passou pela rave, hardcore e jungle para as produções amadoras de UK garage, dubstep e grime. Um set único de club music vanguardista, pelas mãos de dois dos melhores DJs do Reino Unido.'),
(56, 1, 'Skream b2b Mala', 'Uma dupla pioneira de peso', 'No início dos anos 2000, Skream e Mala levaram o dubstep do Sul de Londres para o mundo. A incrivelmente melódica ‘Midnight Request Line’ de Skream tornou-se no primeiro \'hit\' deste género musical, enquanto o total controlo do baixo de Mala (como parte da lendária equipa de produção DMZ) ajudou a levar o dubstep até aos ouvidos de muitos, entre eles Ricardo Villalobos, chegando até aos fãs de jungle old-school e reggae. No Sónar Lisboa vão prestar uma homenagem às suas raízes com um set único, mostrando que o dubstep continua a ter impacto na música eletrónica de 2023.'),
(57, 1, 'Sofia Kourtesis DJ set', 'Electrónica expressiva com mundo', 'Ao trabalhar entre Lima e Berlim, Sofia Kourtesis preenche a lacuna existente entre a electrónica reluzente e expressiva, e a melancolia da pista de dança. Nos seus EPs para a Studio Barnhus e a Ninja Tune, usou gravações de campo e trechos de vocais para tecer temas de cariz profundamente pessoal, uma colagem que surge como representação de todas as suas experiências e viagens. Esta mesma intimidade toma conta dos seus sets, onde busca as suas influências europeias e sul americanas para alcançar paisagens sonoras que são igualmente introspetivas e alegres. Não percas esta estrela em ascensão no Sónar Lisboa.'),
(58, 1, 'Telma', 'Um talento discreto e versátil', 'Desde que fez de Lisboa sua casa em 2011, a Telma cresceu passo a passo até se tornar numa presença habitual e reconhecida, tanto em Lisboa como no Porto. Depois de ter começado como jornalista musical e fotógrafa de eventos, formou-se na arte que a permite agora estar do outro lado da cabine. Essas experiências - ouvir atentamente, sentir a multidão - deram-lhe uma versatilidade impressionante, tornando-a numa escolha óbvia para warm ups de maior prestígio. Chicago house, Detroit electro, UK breaks, hip-hop, funk, disco… Toca de tudo e mais alguma coisa com uma destreza singular. Vem ouvir esta artista local, discreta e cheia de talento, fazer das suas no Sónar Lisboa.'),
(59, 1, 'Throes + The Shine', 'Electrónica e rock de encontro ao kuduro', 'Vindos de Luanda via Porto, os Throes + The Shine são um grupo composto, que passou dez anos a juntar música electrónica e rock (Throes) com kuduro angolano (The Shine). O resultado é uma mistura tempestuosa que reúne a energia dos três géneros. Com o seu último álbum, “Aqui”, lançado em 2022, continuaram a aperfeiçoar o plano que começaram a traçar há uma década, uma explosão furiosa de música que passa pelo hip-hop, r&b, electrónica, e dezenas de outros géneros. Ouve-os dar vida a essa explosão no Sónar Lisboa 2023.'),
(60, 1, 'VIL', 'The Groove Dealer', 'O labirinto musical de Nuno Costa começa em 2008 com o projecto Warface, onde ensaia e explora ritmos quebrados oriundos do UK como Dubstep, Drum & Bass e UK Garage. Apesar de realizado, é no mundo do Techno que encontra o amor maior, contribuindo de forma decisiva para a emancipação do género com a formação da editora Hayes Collective e com lançamentos aclamados em editoras consagradas como a Synewave NY e a Klockworks. A musicalidade, qualidade dos seus sets e personalidade agregadora levam a que a agência Outlined AM se interesse pela carreira de VIL, abrindo portas ao circuito de Techno europeu, onde espalha groove e incendeia o dancefloor a cada vez que actua.\nhttps://soundcloud.com/vilmusic'),
(61, 1, 'Violet b2b Photonz', 'Defensores incansáveis da pista de dança', 'Violet e Photonz têm-se vindo a dedicar à cultura musical lisboeta. Co-fundadores da estação de rádio comunitária Quântica, também ajudam a gerir os eventos queer, sex-positive Mina, e o espaço cultural DIY Planeta Manas, para além das suas editoras, a Naive e One Eyed Jacks.De alguma forma encontram ainda tempo para produzir a sua música, com lançamentos na Dark Entries, editora de culto de São Francisco. Como DJs, têm afinidade pelas sonoridades breakbeat-heavy do Reino Unido, mas também prestam homenagem à cultura house dos anos 90 em Portugal, e a inúmeros outros momentos da história rave e da música electrónica. Uma combinação com a qual se pode sempre contar no que toca a exceder expectativas.'),
(62, 1, 'VTSS', 'A principal criadora de sensações na música de dança', '“Não sou propriamente uma DJ de techno” é assim que Martyna Maja se descreve. A produtora e DJ polaca adora ritmos rápidos e intensos, mas a recreação também faz parte do seu cunho pessoal na música de dança. Presta atenção e vais ouvir diferentes cores, nuances abstratas e vibrantes, melodias adversas – uma mistura drástica entre trance, EBM, hardcore que chega até à música pop.'),
(63, 1, 'WhoMadeWho live', 'Emotional electronica arrebatadora', 'O trio dinamarquês WhoMadewho combina os sons condutores da música eletrónica com a precisão do jazz e a força do rock. O resultado é uma perspetiva arrebatadora e emocional da electronica que está perfeitamente calibrada para a pista de dança, como provam as suas colaborações com Michael Mayer, Frank Wiedemann (Innervisions), Mano Le Tough e Axel Boman. Eles vão apresentar a sua banda eletrónica \"desconstruída\" ao Sónar Lisboa para uma atuação ao vivo hipnotizante.'),
(64, 1, 'Yen Sung', 'O segredo mais bem guardado de Portugal', 'A palavra ícone é demasiado utilizada, mas Yen Sung merece o rótulo. Nos anos 90, ela abriu caminho para as mulheres na música em Portugal, ao mesmo tempo que trazia a electrónica para o país. Residente de longa data no lendário Lux Frágil, a profundidade dos seus conhecimentos musicais não tem paralelo, deambulando sem esforço por entre géneros, estilos e estados de espírito no mesmo set. Com uma versatilidade única, que vai do house e techno, e atravessao hip-hop, funk, R&B e disco. Preparem-se para uma masterclass musical no Sónar Lisboa 2023.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `bilhete`
--

CREATE TABLE `bilhete` (
  `id` int(11) NOT NULL,
  `participante` int(11) NOT NULL,
  `evento` int(11) NOT NULL,
  `serie` int(11) NOT NULL,
  `codigo` varchar(12) DEFAULT NULL,
  `pagamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Extraindo dados da tabela `bilhete`
--

INSERT INTO `bilhete` (`id`, `participante`, `evento`, `serie`, `codigo`, `pagamento`) VALUES
(1, 1, 1, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `carregamento_cashless`
--

CREATE TABLE `carregamento_cashless` (
  `movimento` int(11) NOT NULL,
  `pagamento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Extraindo dados da tabela `carregamento_cashless`
--

INSERT INTO `carregamento_cashless` (`movimento`, `pagamento`) VALUES
(1, 2),
(17, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comerciante`
--

CREATE TABLE `comerciante` (
  `id` int(11) NOT NULL,
  `evento` int(11) NOT NULL,
  `designacao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Extraindo dados da tabela `comerciante`
--

INSERT INTO `comerciante` (`id`, `evento`, `designacao`) VALUES
(1, 1, 'CK - GA PCL DAY 2 APRIL'),
(2, 1, 'AC - PCL DAY 2 APRIL IN'),
(3, 1, 'PCL - BAR C'),
(4, 1, 'BRASILEIRINHA'),
(5, 1, 'AO TACO'),
(6, 1, 'PCL - BAR A');

-- --------------------------------------------------------

--
-- Estrutura da tabela `concerto`
--

CREATE TABLE `concerto` (
  `id` int(11) NOT NULL,
  `evento` int(11) NOT NULL,
  `artista` int(11) NOT NULL,
  `palco` int(11) NOT NULL,
  `data_hora_inicio` datetime NOT NULL,
  `data_hora_fim` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Extraindo dados da tabela `concerto`
--

INSERT INTO `concerto` (`id`, `evento`, `artista`, `palco`, `data_hora_inicio`, `data_hora_fim`) VALUES
(1, 1, 7, 1, '2023-04-01 04:30:00', '2023-04-01 05:30:00'),
(2, 1, 8, 2, '2023-04-01 01:10:00', '2023-04-01 02:10:00'),
(3, 1, 9, 1, '2023-04-02 21:30:00', '2023-04-02 22:30:00'),
(4, 1, 10, 2, '2023-03-31 22:00:00', '2023-03-31 23:00:00'),
(5, 1, 11, 5, '2023-04-01 14:00:00', '2023-04-01 15:00:00'),
(6, 1, 12, 1, '2023-03-31 01:30:00', '2023-03-31 02:30:00'),
(7, 1, 13, 2, '2023-04-01 03:00:00', '2023-04-01 04:00:00'),
(8, 1, 14, 4, '2023-04-02 18:30:00', '2023-04-02 19:30:00'),
(9, 1, 15, 4, '2023-04-02 14:00:00', '2023-04-02 15:00:00'),
(10, 1, 16, 1, '2023-03-31 22:00:00', '2023-03-31 23:00:00'),
(11, 1, 17, 1, '2023-04-02 20:30:00', '2023-04-02 21:30:00'),
(12, 1, 18, 5, '2023-04-02 18:30:00', '2023-04-02 19:30:00'),
(13, 1, 19, 4, '2023-04-01 18:00:00', '2023-04-01 19:00:00'),
(14, 1, 20, 4, '2023-04-02 19:30:00', '2023-04-02 20:30:00'),
(15, 1, 21, 4, '2023-04-02 17:00:00', '2023-04-02 18:00:00'),
(16, 1, 22, 1, '2023-04-01 22:30:00', '2023-04-01 23:30:00'),
(17, 1, 23, 1, '2023-04-01 23:00:00', '2023-04-02 00:00:00'),
(18, 1, 24, 5, '2023-04-01 18:00:00', '2023-04-01 19:00:00'),
(19, 1, 25, 1, '2023-04-01 03:05:00', '2023-04-01 04:05:00'),
(20, 1, 26, 3, '2023-03-31 18:00:00', '2023-03-31 19:00:00'),
(21, 1, 27, 1, '2023-04-01 18:30:00', '2023-04-01 19:30:00'),
(22, 1, 28, 4, '2023-04-01 14:00:00', '2023-04-01 15:00:00'),
(23, 1, 29, 1, '2023-04-02 15:30:00', '2023-04-02 16:30:00'),
(24, 1, 30, 3, '2023-04-01 19:30:00', '2023-04-01 20:30:00'),
(25, 1, 31, 1, '2023-04-01 02:00:00', '2023-04-01 03:00:00'),
(26, 1, 32, 1, '2023-03-31 03:00:00', '2023-03-31 04:00:00'),
(27, 1, 33, 2, '2023-03-31 23:00:00', '2023-04-01 00:00:00'),
(28, 1, 34, 2, '2023-04-01 23:00:00', '2023-04-02 00:00:00'),
(29, 1, 35, 1, '2023-04-02 14:00:00', '2023-04-02 15:00:00'),
(30, 1, 36, 2, '2023-03-31 04:30:00', '2023-03-31 05:30:00'),
(31, 1, 37, 1, '2023-04-02 18:20:00', '2023-04-02 19:20:00'),
(32, 1, 38, 4, '2023-04-02 15:30:00', '2023-04-02 16:30:00'),
(33, 1, 39, 2, '2023-04-01 22:00:00', '2023-04-01 23:00:00'),
(34, 1, 40, 1, '2023-04-01 15:30:00', '2023-04-01 16:30:00'),
(35, 1, 41, 1, '2023-03-31 00:05:00', '2023-03-31 01:05:00'),
(36, 1, 42, 3, '2023-03-31 19:30:00', '2023-03-31 20:30:00'),
(37, 1, 43, 5, '2023-04-01 16:00:00', '2023-04-01 17:00:00'),
(38, 1, 44, 1, '2023-04-01 16:55:00', '2023-04-01 17:55:00'),
(39, 1, 45, 5, '2023-04-02 15:30:00', '2023-04-02 16:30:00'),
(40, 1, 46, 1, '2023-04-01 14:00:00', '2023-04-01 15:00:00'),
(41, 1, 47, 2, '2023-03-31 00:00:00', '2023-03-31 01:00:00'),
(42, 1, 48, 1, '2023-04-01 00:30:00', '2023-04-01 01:30:00'),
(43, 1, 49, 1, '2023-04-01 20:00:00', '2023-04-01 21:00:00'),
(44, 1, 50, 1, '2023-03-31 04:30:00', '2023-03-31 05:30:00'),
(45, 1, 51, 5, '2023-04-02 19:30:00', '2023-04-02 20:30:00'),
(46, 1, 52, 1, '2023-04-02 19:25:00', '2023-04-02 20:25:00'),
(47, 1, 53, 4, '2023-04-01 16:00:00', '2023-04-01 17:00:00'),
(48, 1, 54, 1, '2023-04-02 17:00:00', '2023-04-02 18:00:00'),
(49, 1, 55, 5, '2023-04-01 19:00:00', '2023-04-01 20:00:00'),
(50, 1, 56, 2, '2023-03-31 03:00:00', '2023-03-31 04:00:00'),
(51, 1, 57, 1, '2023-03-31 22:30:00', '2023-03-31 23:30:00'),
(52, 1, 58, 5, '2023-04-02 14:00:00', '2023-04-02 15:00:00'),
(53, 1, 59, 2, '2023-04-01 05:00:00', '2023-04-01 06:00:00'),
(54, 1, 60, 4, '2023-04-01 19:30:00', '2023-04-01 20:30:00'),
(55, 1, 61, 1, '2023-04-02 23:30:00', '2023-04-03 00:30:00'),
(56, 1, 62, 2, '2023-03-31 01:30:00', '2023-03-31 02:30:00'),
(57, 1, 63, 2, '2023-04-01 00:00:00', '2023-04-01 01:00:00'),
(58, 1, 64, 5, '2023-04-02 17:00:00', '2023-04-02 18:00:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `conta_cashless`
--

CREATE TABLE `conta_cashless` (
  `id` int(11) NOT NULL,
  `participante` int(11) NOT NULL,
  `evento` int(11) NOT NULL,
  `valor_atual` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Extraindo dados da tabela `conta_cashless`
--

INSERT INTO `conta_cashless` (`id`, `participante`, `evento`, `valor_atual`) VALUES
(1, 1, 1, 36);

-- --------------------------------------------------------

--
-- Estrutura da tabela `entrada`
--

CREATE TABLE `entrada` (
  `id` int(11) NOT NULL,
  `bilhete` int(11) NOT NULL,
  `data` date NOT NULL DEFAULT curdate(),
  `hora` time NOT NULL DEFAULT curtime()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Extraindo dados da tabela `entrada`
--

INSERT INTO `entrada` (`id`, `bilhete`, `data`, `hora`) VALUES
(1, 1, '2023-04-01', '16:34:07');

-- --------------------------------------------------------

--
-- Estrutura da tabela `evento`
--

CREATE TABLE `evento` (
  `id` int(11) NOT NULL,
  `designacao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Extraindo dados da tabela `evento`
--

INSERT INTO `evento` (`id`, `designacao`) VALUES
(1, 'Sonar 2023');

-- --------------------------------------------------------

--
-- Estrutura da tabela `gasto_cashless`
--

CREATE TABLE `gasto_cashless` (
  `movimento` int(11) NOT NULL,
  `produto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `valor_unitario` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Extraindo dados da tabela `gasto_cashless`
--

INSERT INTO `gasto_cashless` (`movimento`, `produto`, `quantidade`, `valor_unitario`) VALUES
(2, 1, 1, 1),
(3, 2, 1, 8.5),
(4, 3, 1, 12),
(5, 4, 1, 8.5),
(6, 5, 1, 8.5),
(7, 6, 1, 13),
(8, 7, 1, 13),
(9, 6, 1, 13),
(10, 8, 1, 8.5),
(11, 9, 2, 4),
(12, 10, 1, 1),
(13, 11, 3, 2.5),
(14, 12, 1, 4.5),
(15, 12, 1, 4.5),
(16, 11, 1, 2.5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `movimento_cashless`
--

CREATE TABLE `movimento_cashless` (
  `id` int(11) NOT NULL,
  `tipo` enum('gasto','carregamento') NOT NULL,
  `conta` int(11) NOT NULL,
  `valor` double NOT NULL,
  `saldo` double NOT NULL,
  `data` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Extraindo dados da tabela `movimento_cashless`
--

INSERT INTO `movimento_cashless` (`id`, `tipo`, `conta`, `valor`, `saldo`, `data`) VALUES
(1, 'carregamento', 1, 100, 100, '2023-04-02 16:15:00'),
(2, 'gasto', 1, 1, 99, '2023-04-02 18:39:00'),
(3, 'gasto', 1, 8.5, 90.5, '2023-04-02 18:39:00'),
(4, 'gasto', 1, 12, 78.5, '2023-04-02 19:58:00'),
(5, 'gasto', 1, 8.5, 70, '2023-04-02 20:13:00'),
(6, 'gasto', 1, 8.5, 61.5, '2023-04-02 21:38:00'),
(7, 'gasto', 1, 13, 48.5, '2023-04-02 22:16:00'),
(8, 'gasto', 1, 13, 35.5, '2023-04-02 22:16:00'),
(9, 'gasto', 1, 13, 22.5, '2023-04-02 22:17:00'),
(10, 'gasto', 1, 8.5, 64, '2023-04-02 23:47:00'),
(11, 'gasto', 1, 8, 56, '2023-04-03 00:04:00'),
(12, 'gasto', 1, 1, 55, '2023-04-03 00:25:00'),
(13, 'gasto', 1, 7.5, 47.5, '2023-04-03 00:25:00'),
(14, 'gasto', 1, 4.5, 43, '2023-04-03 00:25:00'),
(15, 'gasto', 1, 4.5, 38.5, '2023-04-03 01:38:00'),
(16, 'gasto', 1, 2.5, 36, '2023-04-03 02:02:00'),
(17, 'carregamento', 1, 50, 72.5, '2023-04-02 23:46:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento`
--

CREATE TABLE `pagamento` (
  `id` int(11) NOT NULL,
  `entidade` int(11) NOT NULL,
  `referencia` int(11) NOT NULL,
  `valor` double NOT NULL,
  `data_compra` datetime NOT NULL DEFAULT current_timestamp(),
  `data_validado` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Extraindo dados da tabela `pagamento`
--

INSERT INTO `pagamento` (`id`, `entidade`, `referencia`, `valor`, `data_compra`, `data_validado`) VALUES
(1, 11201, 340220304, 40, '2023-08-29 00:44:54', '2023-02-02 18:39:00'),
(2, 11201, 304201053, 100, '2023-04-02 16:10:00', '2023-04-02 16:15:00'),
(3, 11201, 212039342, 50, '2023-04-02 23:45:00', '2023-04-02 23:46:00');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pagamento_cashless`
--

CREATE TABLE `pagamento_cashless` (
  `pagamento` int(11) NOT NULL,
  `conta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Extraindo dados da tabela `pagamento_cashless`
--

INSERT INTO `pagamento_cashless` (`pagamento`, `conta`) VALUES
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `palco`
--

CREATE TABLE `palco` (
  `id` int(11) NOT NULL,
  `evento` int(11) NOT NULL,
  `designacao` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Extraindo dados da tabela `palco`
--

INSERT INTO `palco` (`id`, `evento`, `designacao`) VALUES
(1, 1, 'SonarClub by Estrella Damm'),
(2, 1, 'SonarHall'),
(3, 1, 'Estufa Fria'),
(4, 1, 'SonarPark by Carhartt WIP'),
(5, 1, 'SonarVillage');

-- --------------------------------------------------------

--
-- Estrutura da tabela `participante`
--

CREATE TABLE `participante` (
  `id` int(11) NOT NULL,
  `email` varchar(64) NOT NULL,
  `nome` text NOT NULL,
  `data_registo` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Extraindo dados da tabela `participante`
--

INSERT INTO `participante` (`id`, `email`, `nome`, `data_registo`) VALUES
(1, 'joao.sousa@gmail.com', 'João Sousa', '2023-08-29 00:43:11');

-- --------------------------------------------------------

--
-- Estrutura da tabela `produto_comerciante`
--

CREATE TABLE `produto_comerciante` (
  `id` int(11) NOT NULL,
  `comerciante` int(11) NOT NULL,
  `designacao` text NOT NULL,
  `valor` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Extraindo dados da tabela `produto_comerciante`
--

INSERT INTO `produto_comerciante` (`id`, `comerciante`, `designacao`, `valor`) VALUES
(1, 3, 'COPO SPIRITS', 1),
(2, 3, 'HAVANA CLUB 3 AÑOS', 8.5),
(3, 4, 'COXA - Box 20', 12),
(4, 3, 'OLMECA TEQUILA', 8.5),
(5, 3, 'ABSOLUT', 8.5),
(6, 5, 'Burrito Chicken', 13),
(7, 5, 'Burrito Carnitas', 13),
(8, 6, 'OLMECA TEQUILA', 8.5),
(9, 6, 'SHOT', 4),
(10, 3, 'COPO BEER', 1),
(11, 3, 'ÁGUA', 2.5),
(12, 3, 'SIDRA CORAL', 4.5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `serie_bilhetes`
--

CREATE TABLE `serie_bilhetes` (
  `id` int(11) NOT NULL,
  `evento` int(11) NOT NULL,
  `designacao` text NOT NULL,
  `numero_bilhetes` int(11) NOT NULL,
  `limite_vendas` date NOT NULL,
  `custo` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Extraindo dados da tabela `serie_bilhetes`
--

INSERT INTO `serie_bilhetes` (`id`, `evento`, `designacao`, `numero_bilhetes`, `limite_vendas`, `custo`) VALUES
(1, 1, 'Série 1', 200, '2022-10-01', 30),
(2, 1, 'Série 2', 300, '2022-12-31', 50),
(3, 1, 'Série 3', 500, '2023-02-28', 80);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `artista`
--
ALTER TABLE `artista`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_artista_evento` (`evento`);

--
-- Índices para tabela `bilhete`
--
ALTER TABLE `bilhete`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bilhete_evento` (`evento`),
  ADD KEY `fk_bilhete_participante` (`participante`),
  ADD KEY `fk_bilhete_serie` (`serie`),
  ADD KEY `fk_bilhete_pagamento` (`pagamento`);

--
-- Índices para tabela `carregamento_cashless`
--
ALTER TABLE `carregamento_cashless`
  ADD PRIMARY KEY (`movimento`),
  ADD KEY `fk_carregamento_cashless_pagamento` (`pagamento`);

--
-- Índices para tabela `comerciante`
--
ALTER TABLE `comerciante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_comerciante_evento` (`evento`);

--
-- Índices para tabela `concerto`
--
ALTER TABLE `concerto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_concerto_evento` (`evento`),
  ADD KEY `fk_concerto_artista` (`artista`),
  ADD KEY `fk_concerto_palco` (`palco`);

--
-- Índices para tabela `conta_cashless`
--
ALTER TABLE `conta_cashless`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_conta_cashless_evento` (`evento`),
  ADD KEY `fk_conta_cashless_participante` (`participante`);

--
-- Índices para tabela `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_bilhete_data` (`data`,`bilhete`),
  ADD KEY `fk_entrada_bilhete` (`bilhete`);

--
-- Índices para tabela `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `gasto_cashless`
--
ALTER TABLE `gasto_cashless`
  ADD PRIMARY KEY (`movimento`),
  ADD KEY `fk_gasto_cashless_produto` (`produto`);

--
-- Índices para tabela `movimento_cashless`
--
ALTER TABLE `movimento_cashless`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_movimento_cashless_conta` (`conta`);

--
-- Índices para tabela `pagamento`
--
ALTER TABLE `pagamento`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `pagamento_cashless`
--
ALTER TABLE `pagamento_cashless`
  ADD PRIMARY KEY (`pagamento`),
  ADD KEY `fk_pagamento_cashless_conta_idx` (`conta`);

--
-- Índices para tabela `palco`
--
ALTER TABLE `palco`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_palco_evento` (`evento`);

--
-- Índices para tabela `participante`
--
ALTER TABLE `participante`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email_UNIQUE` (`email`);

--
-- Índices para tabela `produto_comerciante`
--
ALTER TABLE `produto_comerciante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_produto_comerciante_comerciante` (`comerciante`);

--
-- Índices para tabela `serie_bilhetes`
--
ALTER TABLE `serie_bilhetes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_serie_bilhetes_evento` (`evento`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `artista`
--
ALTER TABLE `artista`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de tabela `bilhete`
--
ALTER TABLE `bilhete`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `comerciante`
--
ALTER TABLE `comerciante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `concerto`
--
ALTER TABLE `concerto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT de tabela `conta_cashless`
--
ALTER TABLE `conta_cashless`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `entrada`
--
ALTER TABLE `entrada`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `evento`
--
ALTER TABLE `evento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `movimento_cashless`
--
ALTER TABLE `movimento_cashless`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `pagamento`
--
ALTER TABLE `pagamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `palco`
--
ALTER TABLE `palco`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `participante`
--
ALTER TABLE `participante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `produto_comerciante`
--
ALTER TABLE `produto_comerciante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT de tabela `serie_bilhetes`
--
ALTER TABLE `serie_bilhetes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `artista`
--
ALTER TABLE `artista`
  ADD CONSTRAINT `fk_artista_evento` FOREIGN KEY (`evento`) REFERENCES `evento` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `bilhete`
--
ALTER TABLE `bilhete`
  ADD CONSTRAINT `fk_bilhete_evento` FOREIGN KEY (`evento`) REFERENCES `evento` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bilhete_pagamento` FOREIGN KEY (`pagamento`) REFERENCES `pagamento` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bilhete_participante` FOREIGN KEY (`participante`) REFERENCES `participante` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_bilhete_serie` FOREIGN KEY (`serie`) REFERENCES `serie_bilhetes` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `carregamento_cashless`
--
ALTER TABLE `carregamento_cashless`
  ADD CONSTRAINT `fk_carregamento_cashless_movimento` FOREIGN KEY (`movimento`) REFERENCES `movimento_cashless` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_carregamento_cashless_pagamento` FOREIGN KEY (`pagamento`) REFERENCES `pagamento_cashless` (`pagamento`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `comerciante`
--
ALTER TABLE `comerciante`
  ADD CONSTRAINT `fk_comerciante_evento` FOREIGN KEY (`evento`) REFERENCES `evento` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `concerto`
--
ALTER TABLE `concerto`
  ADD CONSTRAINT `fk_concerto_artista` FOREIGN KEY (`artista`) REFERENCES `artista` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_concerto_evento` FOREIGN KEY (`evento`) REFERENCES `evento` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_concerto_palco` FOREIGN KEY (`palco`) REFERENCES `palco` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `conta_cashless`
--
ALTER TABLE `conta_cashless`
  ADD CONSTRAINT `fk_conta_cashless_evento` FOREIGN KEY (`evento`) REFERENCES `evento` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_conta_cashless_participante` FOREIGN KEY (`participante`) REFERENCES `participante` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `entrada`
--
ALTER TABLE `entrada`
  ADD CONSTRAINT `fk_entrada_bilhete` FOREIGN KEY (`bilhete`) REFERENCES `bilhete` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `gasto_cashless`
--
ALTER TABLE `gasto_cashless`
  ADD CONSTRAINT `fk_gasto_cashless_movimento` FOREIGN KEY (`movimento`) REFERENCES `movimento_cashless` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_gasto_cashless_produto` FOREIGN KEY (`produto`) REFERENCES `produto_comerciante` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `movimento_cashless`
--
ALTER TABLE `movimento_cashless`
  ADD CONSTRAINT `fk_movimento_cashless_conta` FOREIGN KEY (`conta`) REFERENCES `conta_cashless` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `pagamento_cashless`
--
ALTER TABLE `pagamento_cashless`
  ADD CONSTRAINT `fk_pagamento_cashless_conta` FOREIGN KEY (`conta`) REFERENCES `conta_cashless` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pagamento_cashless_pagamento` FOREIGN KEY (`pagamento`) REFERENCES `pagamento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `palco`
--
ALTER TABLE `palco`
  ADD CONSTRAINT `fk_palco_evento` FOREIGN KEY (`evento`) REFERENCES `evento` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `produto_comerciante`
--
ALTER TABLE `produto_comerciante`
  ADD CONSTRAINT `fk_produto_comerciante_comerciante` FOREIGN KEY (`comerciante`) REFERENCES `comerciante` (`id`) ON UPDATE CASCADE;

--
-- Limitadores para a tabela `serie_bilhetes`
--
ALTER TABLE `serie_bilhetes`
  ADD CONSTRAINT `fk_serie_bilhetes_evento` FOREIGN KEY (`evento`) REFERENCES `evento` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
