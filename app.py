import os
from flask import Flask

app = Flask(__name__)

@app.route('/')
def home():
    return "Hello from Flask CI/CD Pipeline!"

if __name__ == '__main__':
    port = int(os.environ.get("FLASK_PORT", 5000))  # default to 5000 if not set
    app.run(host='0.0.0.0', port=port)
