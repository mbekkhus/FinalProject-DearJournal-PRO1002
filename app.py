from flask import Flask, render_template, abort
from models import POSTS

app = Flask(__name__)


@app.get("/")
def index():
    return render_template("index.html", posts=POSTS)

@app.get("/post/<int:post_id>")
def view_post(post_id: int):
    post = next((p for p in POSTS if p["id"] == post_id), None)
    if post is None:
        abort(404)
    return render_template("post.html", post=post)

if __name__ == "__main__":
    app.run(debug=True, port=5001)


