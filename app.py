from flask import Flask, render_template, abort, request, redirect, url_for
from database import get_posts, get_post, get_comments, add_comment, add_post, update_post

app = Flask(__name__)


@app.get("/")
def index():
    posts = get_posts()
    return render_template("index.html", posts=posts)

@app.route("/post/new", methods=["GET", "POST"])
def create_post():
    if request.method == "POST":
        title = request.form.get("title", "").strip()
        date = request.form.get("date", "").strip()
        body = request.form.get("body", "").strip()

        if title and date and body:
            add_post(title, date, body)
            return redirect(url_for("index"))

    return render_template("create.html")


@app.route("/post/<int:post_id>", methods=["GET", "POST"])
def view_post(post_id):
    post = get_post(post_id)

    if post is None:
        abort(404)

    if request.method == "POST":
        author = request.form.get("author", "Anonym").strip()
        comment = request.form.get("comment", "").strip()

        if author and comment:
            add_comment(post_id, author, comment)

    comments = get_comments(post_id)

    return render_template("post.html", post=post, comments=comments)

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


if __name__ == "__main__":
    app.run(debug=True, port=5001)
