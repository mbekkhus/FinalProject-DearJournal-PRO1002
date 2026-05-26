import sqlite3
import os

TEST_DB = "test.db"


def test_database_contains_posts():
    # Delete old test database
    if os.path.exists(TEST_DB):
        os.remove(TEST_DB)

    # Create test database
    conn = sqlite3.connect(TEST_DB)
    cursor = conn.cursor()

    # Load schema and test data
    with open("schema.sql", "r") as f:
        schema = f.read()

    cursor.executescript(schema)

    # Fetch posts
    cursor.execute("SELECT * FROM posts")
    posts = cursor.fetchall()

    # Test that the database contains at least 10 posts
    assert len(posts) >= 10

    conn.close()

    # Clean up
    os.remove(TEST_DB)