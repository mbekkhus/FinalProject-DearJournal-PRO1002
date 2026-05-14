# Dear Journal

Dear Journal is a personal blogging application built with Flask and SQLite.
The app lets users view blog posts, read individual posts, add comments, edit existing posts, and filter posts by tags. 


## Features 

- View all blog posts on the homepage 
- View a single blog post
- Create new blog posts 
- Edit existing blog posts 
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
- Tags are added through the database seed data, not through the create/edit forms
- The project does not include delete functionality.
- The date field is stored in ISO format to make sorting by date easier


## Future improvements 

- Add login/logout functionality 
- Add delete functionality for posts and comments 
- Allow users to add and edit tags from the form 
- Add flash messages after creating or editing posts 
- Add more automated tests 


## Security considerations 

The app uses parameterized SQL queries with placeholders to reduce the risk of SQL injection. User input is also validated in the Flask routes before being saved to the database. 


## Testing 

The application has been manually tested in the browser to verify core functionality. 

The following user flows have been tested: 

- Creating new blog posts
- Viewing all posts on the homepage 
- Viewing individual blog posts 
- Editing existing blog posts 
- Adding comments to posts 
- Filtering posts by tags 

Basic validation has been implemented in the Flask routes to ensure that required fields are not empty before saving data.

Database operations have been verified by ensuring that data is correctly stored and retrieved using SQLite queries. 

Due to the scope of the project, automated tests have not been implemented. 

## How to run tests 

Testing is performed manually through the browser. 

To test the application: 

- Start the application using the instructions above 
- Create a new blog post 
- View posts on the homepage
- Open a single post 
- Edit an existing post 
- Add comments 
- Click on tags to filters posts 

These steps verify the main functionality of the application. 
