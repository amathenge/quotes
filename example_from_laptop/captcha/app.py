from flask import Flask, render_template, request
from flask_recaptcha import ReCaptcha
import os

# https://python.plainenglish.io/how-to-use-google-recaptcha-with-flask-dbd79d5ea193

app = Flask(__name__)
app.config['SECRET_KEY'] = os.urandom(24)
# app.config['RECAPTCHA_ENABLED'] = True
# app.config['RECAPTCHA_USE_SSL'] = True
# app.config['RECAPTCHA_PUBLIC_KEY'] = 'key goes here'
# app.config['RECAPTCHA_PRIVATE_KEY'] = 'key goes here'
app.config['RECAPTCHA_SITE_KEY'] = 'key goes here'
app.config['RECAPTCHA_SECRET_KEY'] = 'key goes here'

recaptcha = ReCaptcha(app)

@app.route('/', methods=['GET', 'POST'])
def index():
    message = ''
    if request.method == 'POST':
        if recaptcha.verify():
            message = 'Thank you for completing the form'
        else:
            message = 'Please fill out the form'

    return render_template('index.html', message=message)

if __name__ == '__main__':
    app.run(debug=True)