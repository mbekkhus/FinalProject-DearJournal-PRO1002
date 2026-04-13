from flask import Flask, render_template, abort, request
from database import get_posts, get_post, get_comments, add_comment

app = Flask(__name__)


@app.get("/")
def index():
    posts = get_posts()
    return render_template("index.html", posts=posts)


@app.route("/post/<int:post_id>", methods=["GET", "POST"])
def view_post(post_id):
    post = get_post(post_id)

    if post is None:
        abort(404)

    if request.method == "POST":
        comment = request.form.get("comment", "").strip()

        if comment:
            add_comment(post_id, comment)

    comments = get_comments(post_id)

    return render_template("post.html", post=post, comments=comments)


if __name__ == "__main__":
    app.run(debug=True, port=5001)
