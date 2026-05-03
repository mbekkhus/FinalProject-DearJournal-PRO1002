DROP TABLE IF EXISTS comments;
DROP TABLE IF EXISTS posts;

CREATE TABLE posts (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    date TEXT NOT NULL,
    body TEXT NOT NULL
);

CREATE TABLE comments (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    post_id INTEGER NOT NULL,
    author TEXT NOT NULL,
    content TEXT NOT NULL,
    FOREIGN KEY (post_id) REFERENCES posts(id)
);

-- Eksempel innlegg
INSERT INTO posts (title, date, body)
VALUES ('Hei Bloggen!', '2026-04-13', 'Dette er mitt første blogginnlegg.');

INSERT INTO posts (title, date, body)
VALUES ('Hei Bloggen!', '2026-04-14', 'Jeg kjører litt tester på innlegg, så her er et til.');

INSERT INTO posts (title, date, body)
VALUES ('Hei Bloggen!', '2026-04-15', 'Nå begynner grunnstruktur å endelig komme litt på plass. Det er mye å lære og henge med på.');

INSERT INTO posts (title, date, body)
VALUES ('Hei Bloggen!', '2026-04-16', 'Dette begynner jo å ligne litt på en blogg.');

-- Eksempel kommentarer
INSERT INTO comments (post_id, author, content)
VALUES (1, 'Marte', 'Dette var bra!');

INSERT INTO comments (post_id, author, content)
VALUES (1, 'Ola', 'Enig!');