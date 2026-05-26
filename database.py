import sqlite3

DB_NAME = "blog.db"


# Database connection
def get_connection():
    conn = sqlite3.connect(DB_NAME)
    conn.row_factory = sqlite3.Row
    return conn

# Post queries
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

# Comment queries
def get_comments(post_id):
    conn = get_connection()
    comments = conn.execute(
        "SELECT * FROM comments WHERE post_id = ?", (post_id,)
    ).fetchall()
    conn.close()
    return comments


def add_comment(post_id, title, author, date, content):
    conn = get_connection()
    conn.execute(
        "INSERT INTO comments (post_id, title, author, date, content) VALUES (?, ?, ?, ?, ?)",
        (post_id, title, author, date, content),
    )
    conn.commit()
    conn.close()

# Post mutations
def add_post(title, date, body, image, tag_id):
    conn = get_connection()
    cursor = conn.cursor()

    cursor.execute(
        "INSERT INTO posts (title, date, body, image) VALUES (?, ?, ?, ?)",
        (title, date, body, image),
    )

    post_id = cursor.lastrowid

    conn.execute(
        "INSERT INTO post_tags (post_id, tag_id) VALUES (?, ?)",
        (post_id, tag_id),
    )

    conn.commit()
    conn.close()


def update_post(post_id, title, date, body):
    conn = get_connection()
    conn.execute(
        "UPDATE posts SET title = ?, date = ?, body = ? WHERE id = ?",
        (title, date, body, post_id),
    )
    conn.commit()
    conn.close()

# Tag queries
def get_tags_for_post(post_id):
    conn = get_connection()
    tags = conn.execute(
        """
        SELECT tags.*
        FROM tags
        JOIN post_tags ON tags.id = post_tags.tag_id
        WHERE post_tags.post_id = ?
        ORDER BY tags.name
        """,
        (post_id,),
    ).fetchall()
    conn.close()
    return tags


def get_posts_by_tag(tag_name):
    conn = get_connection()
    posts = conn.execute(
        """
        SELECT posts.*
        FROM posts
        JOIN post_tags ON posts.id = post_tags.post_id
        JOIN tags ON tags.id = post_tags.tag_id
        WHERE tags.name = ?
        ORDER BY posts.date DESC
        """,
        (tag_name,),
    ).fetchall()
    conn.close()
    return posts

# Delete functions
def delete_post(post_id):
    conn = get_connection()

    conn.execute("DELETE FROM comments WHERE post_id = ?", (post_id,))
    conn.execute("DELETE FROM post_tags WHERE post_id = ?", (post_id,))
    conn.execute("DELETE FROM posts WHERE id = ?", (post_id,))

    conn.commit()
    conn.close()

def delete_comment(comment_id):
    conn = get_connection()

    conn.execute(
        "DELETE FROM comments WHERE id = ?",
        (comment_id,)
    )

    conn.commit()
    conn.close()
