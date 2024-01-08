#!/bin/bash

# Create folders and files for the AirBnB API project

# Create directories
mkdir -p api/v1/views

# Create __init__.py files
touch api/__init__.py
touch api/v1/__init__.py
touch api/v1/views/__init__.py

# Create index.py file
echo "from api.v1.views import app_views
from flask import jsonify

@app_views.route('/status', methods=['GET'])
def get_status():
    \"\"\"Returns the status of the API\"\"\"
    return jsonify({\"status\": \"OK\"})" > api/v1/views/index.py

# Create app.py file
echo "from flask import Flask
from models import storage
from api.v1.views import app_views
import os

app = Flask(__name__)

app.register_blueprint(app_views, url_prefix='/api/v1')

@app.teardown_appcontext
def teardown_appcontext(exception):
    \"\"\"Closes the storage on teardown.\"\"\"
    storage.close()

if __name__ == \"__main__\":
    host = os.getenv('HBNB_API_HOST', '0.0.0.0')
    port = int(os.getenv('HBNB_API_PORT', 5000))
    app.run(host=host, port=port, threaded=True)" > api/v1/app.py

echo "Project structure created successfully!"

