from flask import Flask, request, jsonify
import numpy as np
import pickle

with open('model/model.pkl', 'rb') as input:
    model = pickle.load(input)

app = Flask(__name__)


@app.route('/predict', methods=['POST'])
def predict():

    features = request.json
    features = np.array([features])
    prediction = model.predict(features)
    prediction = prediction[0]
    return jsonify({'prediction': prediction})


if __name__ == '__main__':

    app.run('0.0.0.0', 5000)
