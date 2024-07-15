from flask import Flask, render_template, request, redirect, url_for, session
from flask_mysqldb import MySQL
from flask_recaptcha import ReCaptcha
import os
import hashlib
import cred

app = Flask(__name__)

app.config['SECRET_KEY'] = os.urandom(24)
# recaptcha
app.config['RECAPTCHA_SITE_KEY'] = cred.recaptcha_site_key
app.config['RECAPTCHA_SECRET_KEY'] =  cred.recaptcha_secret_key

recaptcha = ReCaptcha(app)

app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'quotes'
app.config['MYSQL_PASSWORD'] = 'quotes'
app.config['MYSQL_DB'] = 'quotes'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

# Intialize MySQL
mysql = MySQL(app)

def hashpass(pwd):
    return hashlib.md5(pwd.encode()).hexdigest()

@app.route('/login', methods=['GET', 'POST'])
def login():
    if 'user' in session:
        session.pop('user')

    msg = ''
    if request.method == 'POST':
        if recaptcha.verify():
            user = request.form['username']
            password = request.form['password']
            sql = 'select username, email from users where email = %s and password = %s'
            cur = mysql.connection.cursor()
            cur.execute(sql, [user, hashpass(password)])
            data = cur.fetchone()
            if data == None:
                return render_template('login.html', msg='Invalid user or password')
            session['user'] = data['username']
            session['email'] = data['email']
            return redirect(url_for('home'))
        else:
            # msg = 'Complete Recaptcha Challenge'
            msg = 'recaptcha.verify() returned: <strong>' + str(recaptcha.verify()) + '</strong>'

    return render_template('login.html', msg=msg)

@app.route('/logout')
def logout():
    if 'user' in session:
        session.pop('user')
    if 'email' in session:
        session.pop('email')

    return redirect(url_for('login'))

@app.route('/')
def home():
    if 'user' not in session:
        return redirect(url_for('login'))

    cur = mysql.connection.cursor()
    sql = 'select distinct author from quotes'
    cur.execute(sql)
    authors = cur.fetchall()
    sql = 'select distinct category from quotes'
    cur.execute(sql)
    categories = cur.fetchall()
    return render_template('index.html', authors=authors, categories=categories)

@app.route('/delete/<id>')
def delete(id):
    if 'user' not in session:
        return redirect(url_for('login'))

    sql = 'select author, category, quote, rating from quotes where id = %s'
    cur = mysql.connection.cursor()
    cur.execute(sql, [id])
    data = cur.fetchone()
    author = data['author']
    category = data['category']
    quote = data['quote']
    rating = data['rating']
    sql = 'insert into quotes_deleted (author, category, quote, rating) values (%s, %s, %s, %s)'
    cur.execute(sql, [author, category, quote, rating])
    mysql.connection.commit()
    sql = 'delete from quotes where id = %s'
    cur.execute(sql, [id])
    mysql.connection.commit()

    return redirect(url_for('home'))

@app.route('/add', methods=['GET','POST'])
def add():
    if 'user' not in session:
        return redirect(url_for('login'))

    if request.method == 'POST':
        if request.form['submit'] == 'cancel':
            return redirect(url_for('home'))

        if request.form['submit'] == 'submit':
            author = request.form['author']
            category = request.form['category']
            quote = request.form['quote']
            rating = request.form['rating']
            sql = 'insert into quotes (author, category, quote, rating) values (%s, %s, %s, %s)'
            cur = mysql.connection.cursor()
            cur.execute(sql, [author, category, quote, rating])
            mysql.connection.commit()
            return redirect(url_for('home'))

    sql = 'select distinct category from quotes'
    cur = mysql.connection.cursor()
    cur.execute(sql)
    categories = cur.fetchall()
    return render_template('add.html', categories=categories)

@app.route('/edit/<id>', methods=['GET','POST'])
def edit(id):
    if 'user' not in session:
        return redirect(url_for('login'))

    if request.method == 'POST':
        if request.form['submit'] == 'submit':
            author = request.form['author']
            category = request.form['category']
            quote = request.form['quote']
            rating = request.form['rating']
            sql = 'update quotes set author = %s, category = %s, quote = %s, rating = %s where id = %s'
            cur = mysql.connection.cursor()
            cur.execute(sql, [author, category, quote, rating, id])
            mysql.connection.commit()
            return redirect(url_for('home'))
        elif request.form['submit'] == 'cancel':
            return redirect(url_for('home'))
        else:
            return "this is what request.form['submit'] sent us ==> {}".format(request.form['submit'])

    cur = mysql.connection.cursor()
    sql = 'select id, author, category, quote, rating from quotes where id = %s'
    cur.execute(sql,[id])
    quote = cur.fetchone()
    sql = 'select distinct category from quotes'
    cur.execute(sql)
    categories = cur.fetchall()
    return render_template('edit.html', quote=quote, categories=categories)

@app.route('/quote', methods=['GET', 'POST'])
def quote():
    if 'user' not in session:
        return redirect(url_for('login'))

    if request.method == 'POST':
        author = request.form['author']
        category = request.form['category']
        rating = request.form['rating']

        params = []
        if author == 'ANY' and category == 'ANY' and rating == 'ANY':
            sql = 'select id, author, category, quote, rating from quotes order by rating desc'
        elif author == 'ANY' and category == 'ANY':
            sql = 'select id, author, category, quote, rating from quotes where rating = %s'
            params.append(int(rating))
        elif author == 'ANY' and rating == 'ANY':
            sql = 'select id, author, category, quote, rating from quotes where category = %s'
            params.append(category)
        elif category == 'ANY' and rating == 'ANY':
            sql = 'select id, author, category, quote, rating from quotes where author = %s'
            params.append(author)
        elif author == 'ANY':
            sql = 'select id, author, category, quote, rating from quotes where category = %s or rating = %s'
            params.append(category)
            params.append(int(rating))
        elif category == 'ANY':
            sql = 'select author, category, quote, rating from quotes where author = %s or rating = %s'
            params.append(author)
            params.append(int(rating))
        elif rating == 'ANY':
            sql = 'select author, category, quote, rating from quotes where category = %s or author = %s'
            params.append(category)
            params.append(author)
        else:
            sql = 'select author, category, quote, rating from quotes where author = %s or category = %s or rating = %s'
            params.append(author)
            params.append(category)
            params.append(int(rating))

        cur = mysql.connection.cursor()
        cur.execute(sql, params)
        quotes = cur.fetchall()
        sql = 'select distinct author from quotes'
        cur.execute(sql)
        authors = cur.fetchall()
        sql = 'select distinct category from quotes'
        cur.execute(sql)
        categories = cur.fetchall()
        return render_template('quotes.html', quotes=quotes, authors=authors, categories=categories)

    return redirect(url_for('home'))

if __name__ == '__main__':
    app.run(debug=True)