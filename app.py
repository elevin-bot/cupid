from flask import Flask, render_template, request, redirect, session
import bcrypt, os
from database import sql_select, sql_write

SECRET_KEY = os.environ.get('SECRET_KEY', 'sdfsdfdsf')
app = Flask(__name__)
app.secret_key = SECRET_KEY.encode()

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
    print(results)
    if results:
        user_id = results[0][0]
        hashed_password = results[0][1]
        user_name = results[0][2]
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

def get_args():
    args = {
        'name': request.form.get("name")
     ,  'photo_url': request.form.get("photo_url")
     ,  'gender': request.form.get("gender")
     ,  'age': int(request.form.get("age"))
     ,  'pref_age_from': None if request.form.get("pref_age_from") == '' else int(request.form.get("pref_age_from"))
     ,  'pref_age_to': None if request.form.get("pref_age_to") == '' else int(request.form.get("pref_age_to"))
     ,  'pref_gender': request.form.get("pref_gender")
    }
    return args

@app.route("/register", methods=["POST"])
def register():
    email = request.form.get("email")
    password = request.form.get("password")
    password_hash = bcrypt.hashpw(password.encode(), bcrypt.gensalt()).decode()
    args = get_args()
    sql_write("insert into users (email, password_hash, name, photo_url, gender, age,"
              "pref_age_from, pref_age_to, pref_gender) values(%s,%s,%s,%s,%s,%s,%s,%s,%s)",
              [email, password_hash, args['name'], args['photo_url'], args['gender'], args['age'], args['pref_age_from'], args['pref_age_to'], args['pref_gender']])
    return redirect("/login")

@app.route("/profile_update")
def profile_page():
    results = sql_select("SELECT name, photo_url, gender, age, pref_age_from, pref_age_to, pref_gender from users where id = %s", [session['user_id']])
    profile = {
        'name': results[0][0],
        'photo_url': results[0][1],
        'gender': results[0][2],
        'age': results[0][3],
        'pref_age_from': results[0][4],
        'pref_age_to': results[0][5],
        'pref_gender': results[0][6]
    }        
    user = loggedin()
    return render_template("profile_update.html", profile=profile, user=user)

@app.route("/profile_update", methods=["POST"])
def profile_update():
    args = get_args()
    sql_write("update users set name=%s, photo_url=%s, gender=%s, age=%s, pref_age_from=%s, pref_age_to=%s, pref_gender=%s where id =%s",
              [args['name'], args['photo_url'], args['gender'], args['age'], args['pref_age_from'], args['pref_age_to'], args['pref_gender'], session['user_id']])
    return redirect("/")

@app.route("/cancel")
def cancel():
    return redirect("/")

@app.route("/")
def index():
    user = loggedin()
    return render_template("index.html", user=user)