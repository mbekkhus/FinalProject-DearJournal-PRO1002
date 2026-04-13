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
    post_id INTEGER,
    content TEXT NOT NULL,
    FOREIGN KEY (post_id) REFERENCES posts(id)
);

INSERT INTO posts (title, date, body)
VALUES ('Hei verden', '2026-04-13', 'Dette er hele innlegget. Her er avsnitt 2.');

INSERT INTO posts (title, date, body)
VALUES ('Innlegg 2', '2026-04-14', 'Dette er hele innlegget.');