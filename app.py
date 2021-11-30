# -*- coding: utf-8 -*-

"""
	Ce scipt créé un serveur Flask de base. Ce serveur simule un capteur
	de pression.
"""

from flask import Flask, jsonify
import random

app = Flask(__name__)

"""
	Variables globales qui simulent la mémoire de notre capteur
"""
_calibre = 0
_simulatedPresure = 25.0

# Retour de la version du capteur #
@app.route("/getVersion")
def version():
	return jsonify({
      'version': '2.1.4', 
    })

# Set le calibre du capteur (entier compris entre 0 et 20 inclus) #
@app.route("/setCalibre/<c>")
def setcalibre(c):
	global _calibre
	c = int(c)
	if c >= 0 and c <= 20:
		_calibre = c
		return jsonify({
			  'STATUS': "OK", 
			})
	else:
		return jsonify({
			  'STATUS': "NOK", 
			})

# Retour du calibre actuel du capteur #
@app.route("/getCalibre")
def getcalibre():
	global _calibre
	return jsonify({
      'calibre': _calibre, 
    })

# Retour de la pression mesurée par le capteur #
@app.route("/getPresure")
def getpresure():
	
	# Génération d'une variation #
	if random.randrange(10) < 5:
		presure = _simulatedPresure - random.random()
	else:
		presure = _simulatedPresure + random.random()
	# --         ---         -- #
	
	# Génère une erreure de mesure si décomentée #
	#presure = presure - 24
	
	return jsonify({
      'presure': presure, 
    })

# Générétion d'une pression de test (temps de stabilisation 2 secondes non représenté) #
@app.route("/setPresure/<p>")
def setpresure(p):
	global _simulatedPresure
	p = float(p)
	_simulatedPresure = p
	return jsonify({
		'STATUS': "OK", 
		})

if __name__ == "__main__":
	# Nota : Remplacer l'adresse IP ci-dessous en fonction... #
    app.run(host="127.0.0.1",debug=True)
    
# THE END #