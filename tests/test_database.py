import os
import sqlite3
import sys
from pathlib import Path

sys.path.append(str(Path(__file__).resolve().parents[1]))

from app import app

TEST_DB = "test.db"

# Create a new test database
def create_test_database():
    if os.path.exists(TEST_DB):
        os.remove(TEST_DB)

    conn = sqlite3.connect(TEST_DB)
    conn.row_factory = sqlite3.Row

    with open("schema.sql", "r") as f:
        schema = f.read()
  
    conn.executescript(schema)

    return conn

# Test that the database contains posts
def test_database_contains_posts():
    conn = create_test_database()

    posts = conn.execute("SELECT * FROM posts").fetchall()

    # Check that there are at least 10 posts
    assert len(posts) >= 10

    conn.close()
    os.remove(TEST_DB)


def test_database_contains_tags():
    conn = create_test_database()

    tags = conn.execute("SELECT * FROM tags").fetchall()

    # Check that there are at least 5 tags
    assert len(tags) >= 5

    conn.close()
    os.remove(TEST_DB)

# Test that posts can be filtered by tag
def test_posts_can_be_filtered_by_tag():
    conn = create_test_database()

    posts = conn.execute(
        """
        SELECT posts.*
        FROM posts
        JOIN post_tags ON posts.id = post_tags.post_id
        JOIN tags ON tags.id = post_tags.tag_id
        WHERE tags.name = ?
        """,
        ("hverdag",),
    ).fetchall()

    # Check that there are posts for the tag "hverdag"
    assert len(posts) > 0

    conn.close()
    os.remove(TEST_DB)

# Test that comments can be added
def test_comment_can_be_added():
    conn = create_test_database()

    conn.execute(
        """
        INSERT INTO comments (post_id, title, author, date, content)
        VALUES (?, ?, ?, ?, ?)
        """,
        (1, "Test", "Tester", "2026-05-31", "Dette er en test"),
    )
    conn.commit()

    comments = conn.execute(
        "SELECT * FROM comments WHERE post_id = ?",
        (1,),
    ).fetchall()

    # Check that the comment was added
    assert any(comment["title"] == "Test" for comment in comments)

    conn.close()
    os.remove(TEST_DB)

# Test that the homepage loads
def test_homepage_loads():
    app.config["TESTING"] = True
    client = app.test_client()

    response = client.get("/")

    # Check that the homepage loaded successfully
    assert response.status_code == 200

# Test that an invalid post returns a 404
def test_invalid_post_returns_404():
    app.config["TESTING"] = True
    client = app.test_client()

    response = client.get("/post/9999")

    # Check that the response is a 404
    assert response.status_code == 404