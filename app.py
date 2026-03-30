from flask import Flask, render_template, abort, request
from models import POSTS

app = Flask(__name__)


@app.get("/")
def index():
    return render_template("index.html", posts=POSTS)


@app.route("/post/<int:post_id>", methods=["GET", "POST"])
def view_post(post_id):
    post = next((p for p in POSTS if p["id"] == post_id), None)

    if post is None:
        abort(404)

    if request.method == "POST":
        comment = request.form.get("comment", "").strip()
        print("Kommentar mottatt:", comment)

        if comment:
            post["comments"].append(comment)
            print("Alle kommentarer nå:", post["comments"])

    return render_template("post.html", post=post)


if __name__ == "__main__":
    app.run(debug=True, port=5001)
