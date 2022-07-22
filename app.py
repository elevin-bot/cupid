from flask import Flask, render_template, request, redirect, session
import bcrypt
from database import sql_select, sql_write

app = Flask(__name__)
app.config['SECRET_KEY'] = 'sdfsdfdsf'

def loggedin():
    user = {
        'logged_in': False,
        'user_name': '',
        'user_id': None
    }
    if 'user_id' in session:
        user['user_name'] = session['user_name']
        user['logged_in'] = True
        user['user_id'] = session['user_id']
    return user

@app.route("/login")
def login_page():
    return render_template("login.html")

@app.route("/login", methods=["POST"])
def login():
    email = request.form.get("email")
    password = request.form.get("password")
    results = sql_select("SELECT id, password_hash, name from users where email = %s", [email])
    if results:
        result = results[0]
        user_id = result[0]
        hashed_password = result[1]
        user_name = result[2]
        # Verify password
        if bcrypt.checkpw(password.encode(), hashed_password.encode()):
            # Set id into session cookie
            session['user_id'] = user_id
            session['user_name'] = user_name
            return redirect("/")    
    return redirect("/login")

@app.route("/logout")
def logout():
    session.pop('user_id', None)
    return redirect("/")    

@app.route("/register")
def register_page():
    return render_template("register.html")

@app.route("/register", methods=["POST"])
def register():
    email = request.form.get("email")
    password = request.form.get("password")
    name = request.form.get("name")
    photo_url = request.form.get("photo_url")
    gender = request.form.get("gender")
    age = int(request.form.get("age"))
    pref_age_from = request.form.get("pref_age_from")
    pref_age_to = request.form.get("pref_age_to")
    pref_gender = request.form.get("pref_gender")
    pref_age_from = None if pref_age_from == '' else int(pref_age_from)
    pref_age_to = None if pref_age_to == '' else int(pref_age_to)
    password_hash = bcrypt.hashpw(password.encode(), bcrypt.gensalt()).decode()
    sql_write("insert into users (email, password_hash, name, photo_url, gender, age,"
              "pref_age_from, pref_age_to, pref_gender) values(%s,%s,%s,%s,%s,%s,%s,%s,%s)",
              [email, password_hash, name, photo_url, gender, age, pref_age_from, pref_age_to, pref_gender])
    return redirect("/login")

@app.route("/")
def index():
    user = loggedin()
    return render_template("index.html", logged_in=user['logged_in'])