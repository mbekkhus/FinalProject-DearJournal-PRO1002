from flask import Flask, render_template, abort, request, redirect, url_for
from database import (
    get_posts,
    get_post,
    get_comments,
    add_comment,
    add_post,
    update_post,
    delete_post,
    delete_comment,
    get_tags_for_post,
    get_posts_by_tag,
)

app = Flask(__name__)

# Homepage
@app.get("/")
def index():
    posts = get_posts()

    posts_with_tags = []
    for post in posts:
        posts_with_tags.append({"post": post, "tags": get_tags_for_post(post["id"])})

    return render_template("index.html", posts_with_tags=posts_with_tags)

# Filter by tag
@app.get("/tag/<tag_name>")
def tag_page(tag_name):
    posts = get_posts_by_tag(tag_name)

    posts_with_tags = []
    for post in posts:
        posts_with_tags.append({"post": post, "tags": get_tags_for_post(post["id"])})

    return render_template(
        "tag.html", tag_name=tag_name, posts_with_tags=posts_with_tags
    )

# Create a new post
@app.route("/post/new", methods=["GET", "POST"])
def create_post():
    if request.method == "POST":
        title = request.form.get("title", "").strip()
        date = request.form.get("date", "").strip()
        body = request.form.get("body", "").strip()
        image = request.form.get("image", "").strip()
        tag_id = request.form.get("tag_id", "").strip()

        if title and date and body and image and tag_id:
            add_post(title, date, body, image, tag_id)
            return redirect(url_for("index"))

    return render_template("create.html")

# View a single post and handle comments
@app.route("/post/<int:post_id>", methods=["GET", "POST"])
def view_post(post_id):
    post = get_post(post_id)

    if post is None:
        abort(404)

    if request.method == "POST":
        title = request.form.get("title", "").strip()
        author = request.form.get("author", "Anonym").strip()
        date = request.form.get("date", "").strip()
        comment = request.form.get("comment", "").strip()

        if title and author and date and comment:
            add_comment(post_id, title, author, date, comment)

    comments = get_comments(post_id)

    return render_template("post.html", post=post, comments=comments)

# Edit a post
@app.route("/post/<int:post_id>/edit", methods=["GET", "POST"])
def edit_post(post_id):
    post = get_post(post_id)

    if post is None:
        abort(404)

    if request.method == "POST":
        title = request.form.get("title", "").strip()
        date = request.form.get("date", "").strip()
        body = request.form.get("body", "").strip()

        if title and date and body:
            update_post(post_id, title, date, body)
            return redirect(url_for("view_post", post_id=post_id))

    return render_template("edit.html", post=post)

# Delete posts and comments
@app.post("/post/<int:post_id>/delete")
def delete_post_route(post_id):
    delete_post(post_id)
    return redirect(url_for("index"))

@app.post("/comment/<int:comment_id>/delete/<int:post_id>")
def delete_comment_route(comment_id, post_id):
    delete_comment(comment_id)
    return redirect(url_for("view_post", post_id=post_id))

# Error handling
@app.errorhandler(404)
def page_not_found(error):
    return render_template("404.html"), 404

if __name__ == "__main__":
    app.run(debug=True, port=5001)


