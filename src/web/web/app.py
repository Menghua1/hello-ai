from flask import Flask, render_template, jsonify, request
import os
import requests
from dotenv import load_dotenv

load_dotenv()  # Load environment variables from .env file

app = Flask(__name__)
api_url = os.getenv('API_URL', 'http://api:3100')

# Centralized API request function
def make_api_request(endpoint, method="GET", data=None):
    url = f"{api_url}{endpoint}"
    try:
        if method == "GET":
            response = requests.get(url)
        elif method == "POST":
            response = requests.post(url, json=data)
        
        if response.status_code == 200:
            return jsonify(response.json()), 200
        else:
            return jsonify({"error": "Failed to fetch data from API", "status_code": response.status_code}), response.status_code
    except requests.exceptions.RequestException as e:
        return jsonify({"error": f"Error making request to API: {e}"}), 500

@app.route('/')
def home():
    # Renders the Quotes page
    return render_template('index.html', active_page="home")

@app.route('/chat')
def chat_ui():
    # Renders the Chat page
    return render_template('chat.html', active_page="chat")

@app.route('/quote', methods=['GET'])
def quote():
    return make_api_request("/quote")

@app.route('/chat', methods=['POST'])
def chat():
    user_message = request.json.get('message')
    return make_api_request("/chat", method="POST", data={"message": user_message})

if __name__ == '__main__':
    app.run(debug=True, port=3000)
