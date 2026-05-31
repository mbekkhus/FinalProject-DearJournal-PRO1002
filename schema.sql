DROP TABLE IF EXISTS post_tags;
DROP TABLE IF EXISTS tags;
DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    date TEXT NOT NULL,
    body TEXT NOT NULL,
    image TEXT NOT NULL
);

CREATE TABLE comments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    post_id INTEGER NOT NULL,
    title TEXT NOT NULL,
    author TEXT NOT NULL,
    date TEXT NOT NULL,
    content TEXT NOT NULL,
    FOREIGN KEY (post_id) REFERENCES posts(id)
);

CREATE TABLE tags (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE post_tags (
    post_id INTEGER NOT NULL,
    tag_id INTEGER NOT NULL,
    FOREIGN KEY (post_id) REFERENCES posts(id),
    FOREIGN KEY (tag_id) REFERENCES tags(id),
    PRIMARY KEY (post_id, tag_id)
);

-- Exampel
INSERT INTO posts (title, date, body, image)
VALUES (
  'I dag',
  '2026-05-13',
  'Nå begynner ting å sitte. Små justeringer, men helheten begynner å bli veldig bra.',
  'beige-terasse.jpg'
);

INSERT INTO posts (title, date, body, image)
VALUES (
  'Flyt',
  '2026-05-12',
  'Jeg begynner å komme inn i en god flyt. Ting går litt raskere nå, og jeg skjønner faktisk hva jeg gjør.',
  'concrete-step.jpg'
);

INSERT INTO posts (title, date, body, image)
VALUES (
  'Detaljer',
  '2026-05-09',
  'Jeg har brukt mye tid på detaljer i dag. Spacing, tekst, hover. Små ting, men det gjør mye.',
  'mood-fan.jpg'
);

INSERT INTO posts (title, date, body, image)
VALUES (
  'Ferdig snart',
  '2026-05-06',
  'Det nærmer seg. Jeg prøver å ikke overtenke, bare rydde opp og gjøre det ferdig.',
  'bridge-concrete.jpg'
);

INSERT INTO posts (title, date, body, image)
VALUES (
  'Rolig fremgang',
  '2026-05-03',
  'Det går fremover, litt etter litt. Ikke alt er perfekt, men det begynner å ligne noe.',
  'stair-straight.jpg'
);

INSERT INTO posts (title, date, body, image)
VALUES (
  'Hei bloggen!',
  '2026-04-24',
  'Dette begynner å føles som en fin liten plass. Litt roligere, litt mer meg. Det er fortsatt mye som må på plass, men det er gøy å se at ting fungerer.',
  'beige-chair.jpg'
);

INSERT INTO posts (title, date, body, image)
VALUES (
  'Hverdagen',
  '2026-04-20',
  'Jeg prøver å bli flinkere til å legge merke til de små tingene i hverdagen. Lys, ro, stillhet. Jeg tester litt forskjellig nå, både layout og innhold. Prøver å finne en stil som føles rolig og gjennomført.',
  'inspo-wall.jpg'
);

INSERT INTO posts (title, date, body, image)
VALUES (
  'Rolig morgen',
  '2026-04-18',
  'En kopp kaffe, litt tid alene og mange ideer. I dag har jeg brukt tid på spacing og typografi. Små endringer, men det gjør faktisk stor forskjell.',
  'soft-wall-curtain.jpg'
);

INSERT INTO posts (title, date, body, image)
VALUES (
  'Struktur',
  '2026-04-15',
  'Jeg jobber med å få på plass en god struktur før jeg begynner å style for mye. Det er litt seigt, men veldig nødvendig.',
  'stair-wavy.jpg'
);

INSERT INTO posts (title, date, body, image)
VALUES (
  'Begynnelsen',
  '2026-04-12',
  'Dette er en god start. Jeg prøver og feiler, men jeg lærer.',
  'abstract-circle-beige.jpg'
);

INSERT INTO posts (title, date, body, image)
VALUES (
  'Videre',
  '2026-05-26',
  'Det er fortsatt noen ting jeg vil endre, men jeg prøver å ikke bli sittende fast i detaljer hele tiden. Noe må bare bli ferdig nok, og jeg tror kanskje vi er der nå.',
  'soft-duvet.jpg'
);

-- Example comments
INSERT INTO comments (post_id, title, author, date, content)
VALUES (1, 'Fin lesning', 'Hillevi', '2026-05-14', 'Dette føles som et fint punkt å være på.');

INSERT INTO comments (post_id, title, author, date, content)
VALUES (1, 'Enig', 'Alf', '2026-05-14', 'Det begynner virkelig å sitte nå.');

INSERT INTO comments (post_id, title, author, date, content)
VALUES (2, 'Så sant', 'Oddny', '2026-05-12', 'Kjenner meg igjen i følelsen av at ting plutselig flyter bedre.');

INSERT INTO comments (post_id, title, author, date, content)
VALUES (3, 'Fine detaljer', 'Bergljot', '2026-05-10', 'Liker hvordan små justeringer kan gjøre så mye.');

INSERT INTO comments (post_id, title, author, date, content)
VALUES (4, 'Liker dette', 'Bergljot', '2026-05-07', 'Det er ofte lurt å rydde litt før man sier seg ferdig.');

INSERT INTO comments (post_id, title, author, date, content)
VALUES (6, 'Koselig', 'Rakel', '2026-04-25', 'Dette føltes veldig rolig og fint.');

INSERT INTO comments (post_id, title, author, date, content)
VALUES (7, 'Fint skrevet', 'Hillevi', '2026-04-21', 'Du skriver veldig rolig og fint.');

INSERT INTO comments (post_id, title, author, date, content)
VALUES (8, 'Rolig start', 'Torleif Mio', '2026-04-19', 'Kaffe og små justeringer høres ut som en god morgen.');

-- Tags
INSERT INTO tags (name) VALUES ('hverdag');
INSERT INTO tags (name) VALUES ('design');
INSERT INTO tags (name) VALUES ('prosess');
INSERT INTO tags (name) VALUES ('ro');
INSERT INTO tags (name) VALUES ('struktur');

-- Koble innlegg til tags
INSERT INTO post_tags (post_id, tag_id) VALUES (1, 1);
INSERT INTO post_tags (post_id, tag_id) VALUES (1, 4);

INSERT INTO post_tags (post_id, tag_id) VALUES (2, 1);
INSERT INTO post_tags (post_id, tag_id) VALUES (2, 4);

INSERT INTO post_tags (post_id, tag_id) VALUES (3, 1);
INSERT INTO post_tags (post_id, tag_id) VALUES (3, 2);

INSERT INTO post_tags (post_id, tag_id) VALUES (4, 3);
INSERT INTO post_tags (post_id, tag_id) VALUES (4, 5);

INSERT INTO post_tags (post_id, tag_id) VALUES (5, 3);
INSERT INTO post_tags (post_id, tag_id) VALUES (5, 2);

INSERT INTO post_tags (post_id, tag_id) VALUES (6, 1);
INSERT INTO post_tags (post_id, tag_id) VALUES (6, 4);

INSERT INTO post_tags (post_id, tag_id) VALUES (7, 1);
INSERT INTO post_tags (post_id, tag_id) VALUES (7, 4);

INSERT INTO post_tags (post_id, tag_id) VALUES (8, 1);
INSERT INTO post_tags (post_id, tag_id) VALUES (8, 2);

INSERT INTO post_tags (post_id, tag_id) VALUES (9, 3);
INSERT INTO post_tags (post_id, tag_id) VALUES (9, 5);

INSERT INTO post_tags (post_id, tag_id) VALUES (10, 3);
INSERT INTO post_tags (post_id, tag_id) VALUES (10, 2);
INSERT INTO post_tags (post_id, tag_id) VALUES (11, 3);
INSERT INTO post_tags (post_id, tag_id) VALUES (11, 2);