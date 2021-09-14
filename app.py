from flask import Flask
from lib.hyde import render_hyde_template

app = Flask(__name__)

@app.route('/')
def index():
    return render_hyde_template('index.hy')

if __name__ == '__main__':
    app.run(threaded=True, port=5000)