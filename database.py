import sqlite3

DB_NAME = "blog.db"


def get_connection():
    conn = sqlite3.connect(DB_NAME)
    conn.row_factory = sqlite3.Row
    return conn


def get_posts():
    conn = get_connection()
    posts = conn.execute("SELECT * FROM posts ORDER BY date DESC").fetchall()
    conn.close()
    return posts


def get_post(post_id):
    conn = get_connection()
    post = conn.execute("SELECT * FROM posts WHERE id = ?", (post_id,)).fetchone()
    conn.close()
    return post


def get_comments(post_id):
    conn = get_connection()
    comments = conn.execute(
        "SELECT * FROM comments WHERE post_id = ?", (post_id,)
    ).fetchall()
    conn.close()
    return comments


def add_comment(post_id, content):
    conn = get_connection()
    conn.execute(
        "INSERT INTO comments (post_id, content) VALUES (?, ?)", (post_id, content)
    )
    conn.commit()
    conn.close()
