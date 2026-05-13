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

-- Eksempel innlegg
INSERT INTO posts (title, date, body, image)
VALUES (
  'Hei bloggen!',
  '2026-04-16',
  'Dette begynner å føles som en fin liten plass. Litt roligere, litt mer meg. Det er fortsatt mye som må på plass, men det er gøy å se at ting fungerer.',
  'soft-duvet.jpg'
);

INSERT INTO posts (title, date, body, image)
VALUES (
  'Hverdagen',
  '2026-04-15',
  'Jeg prøver å bli flinkere til å legge merke til de små tingene i hverdagen. Lys, ro, stillhet. Jeg tester litt forskjellig nå, både layout og innhold. Prøver å finne en stil som føles rolig og gjennomført.',
  'inspo-wall.jpg'
);

INSERT INTO posts (title, date, body, image)
VALUES (
  'Rolig morgen',
  '2026-04-14',
  'En kopp kaffe, litt tid alene og mange ideer. I dag har jeg brukt tid på spacing og typografi. Små endringer, men det gjør faktisk stor forskjell.',
  'soft-wall-curtain.jpg'
);

INSERT INTO posts (title, date, body, image)
VALUES (
  'Struktur',
  '2026-04-13',
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

-- Eksempel kommentarer
INSERT INTO comments (post_id, title, author, date, content)
VALUES (1, 'Fin lesning', 'Hillevi', '2026-04-16', 'Flott innlegg!');

INSERT INTO comments (post_id, title, author, date, content)
VALUES (1, 'Enig', 'Alf', '2026-04-16', 'Enig!');

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