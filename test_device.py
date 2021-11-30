import requests
import time

# Adresse IP:PORT du capteur #
__URL__ = "http://127.0.0.1:5000/"

class MaClasseTest(object):
    def __init__(self):
        pass

    # Méthode qui récupère la version du capteur #
    def get_version(self):
        reponse = requests.get(__URL__ + "/getVersion")
        return reponse.json()["version"]

    # Méthodes de set/get du calibre du capteur #
    def set_calibre(self, calibre):
        reponse = requests.get(__URL__ + "/setCalibre/" + str(calibre))
        return reponse.json()["STATUS"]
    def get_calibre(self):
        reponse = requests.get(__URL__ + "/getCalibre")
        return reponse.json()["calibre"]

    # Méthodes de set/get de la pression du capteur #
    def _set_pression(self, pression):
        reponse = requests.get(__URL__ + "/setPresure/" + str(pression))
        return reponse.json()["STATUS"]
    def _get_pression(self):
        reponse = requests.get(__URL__ + "/getPresure")
        return reponse.json()["presure"]
    # Sénario de mesure de pression # -> retourne OK ou NOK si la mesure est bonne
    def senario_mesure_pression(self, pression):
        self._set_pression(pression)
        time.sleep(2)
        return self._get_pression()