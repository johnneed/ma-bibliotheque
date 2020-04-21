from flask import Flask
from flask import render_template
import sqlite3
from flask import g
from stringify import stringify_py

app = Flask(__name__)
DATABASE = 'database/libary-database.db'

def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect(DATABASE)
    return db

@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()

def make_dicts(cursor, row):
    return dict((cursor.description[idx][0], value)
                for idx, value in enumerate(row))

def query_db(query, args=(), one=False):
    db = get_db()
    db.row_factory = make_dicts
    cur = db.execute(query, args)
    rv = cur.fetchall()
    cur.close()
    return (rv[0] if rv else None) if one else rv

@app.route("/")
def index():
    return render_template('index.html')

@app.route("/api/books")
def index2():
    response = []
    for book in query_db('select * from books'):
        response.append(book)
    return {"response": response}

@app.route("/api/books")
def index2():
    response = []
    for book in query_db('select * from books'):
        response.append(book)
    return {"response": response}


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0')