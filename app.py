from flask import Flask, render_template, request, redirect, session
import bcrypt

app = Flask(__name__)
app.config['SECRET_KEY'] = 'sdfsdfdsf'

@app.route("/")
def index():
    return '<h1>Hello</h1>'