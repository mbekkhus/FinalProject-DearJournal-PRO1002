import sqlite3
import os

TEST_DB = "test.db"


def test_database_contains_posts():
    # Slett gammel testdatabase
    if os.path.exists(TEST_DB):
        os.remove(TEST_DB)

    # Lag testdatabase
    conn = sqlite3.connect(TEST_DB)
    cursor = conn.cursor()

    # Last inn skjema og testdata
    with open("schema.sql", "r") as f:
        schema = f.read()

    cursor.executescript(schema)

    # Hent poster
    cursor.execute("SELECT * FROM posts")
    posts = cursor.fetchall()

    # Test at databasen inneholder minst 10 innlegg
    assert len(posts) >= 10

    conn.close()

    # Rydd opp
    os.remove(TEST_DB)