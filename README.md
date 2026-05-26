# Dear Journal

Dear Journal is a personal blogging application built with Flask and SQLite.
The application lets users view blog posts, read individual posts, add comments, edit existing posts, and filter posts by tags. 


## Features 

- View all blog posts on the homepage 
- View a single blog post
- Create new blog posts 
- Edit existing blog posts 
- Delete blog posts and comments
- Add comments to blog posts 
- Display title, date, body, image and tags for each post 
- Filter blog posts by tag 
- SQLite database with seed data 
- Jinja2 template inheritance with a shared base layout 


## Technologies used 

- Python 
- Flask 
- SQLite 
- Jinja2 
- HTML
- CSS


## Setup and how to run

Clone the repository:

git clone https://github.com/mbekkhus/PRO1002-Project-Assignment.git
cd PRO1002-Project-Assignment

Create and activate a virtual environment: 

python3 -m venv .venv
source .venv/bin/activate 

Install Flask: 

pip install flask 

Create the database: 

sqlite3 blog.db < schema.sql

Run the application: 

.venv/bin/python3 app.py 

Open in browser: 

http://127.0.0.1:5001



## Project structure 

app.py - Flask routes and application logic 
database.py - Database connection and query functions 
schema.sql - Database schema and seed data 
templates/ - Jinja2 HTML templates 
static/ - CSS and images 


## Known limitations 

- There is no login system, so creating and editing posts is open
- Tags can be added when creating a post, but existing tags cannot yet be edited from the edit form
- The date field is stored in ISO format to make sorting by date easier


## Future improvements 

- Add login/logout functionality 
- Allow users to add and edit tags from the form 
- Add flash messages after creating or editing posts 
- Add more automated tests 


## Security considerations 

The application uses parameterized SQL queries with placeholders to reduce the risk of SQL injection. User input is also validated in the Flask routes before being saved to the database. 


## Testing 

The application has been manually tested in the browser to verify core functionality. 

The following user flows have been tested: 

- Creating new blog posts
- Viewing all posts on the homepage 
- Viewing individual blog posts 
- Editing existing blog posts 
- Deleting blog posts
- Adding and deleting comments
- Filtering posts by tags 

Basic validation has been implemented in the Flask routes to ensure that required fields are not empty before saving data.

Database operations have also been tested using pytest and SQLite. A simple automated test creates a temporary test database, loads the schema and seed data, and verifies that the database contains at least 10 blog posts.

## How to run tests 

Run the following command from the project root: 

pytest 

The automated test will create a temporary SQLite test database, load the schema and seed data, verify that the database contains at least 10 posts, and then remove the temporary database after the test is completed. 

