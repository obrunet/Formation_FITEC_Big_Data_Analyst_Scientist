import requests
import json


# ici simple EXEMPLE de POST et GET dans notre base elasticsearch
#  http://127.0.0.1:9200/clients/simple/client1

# notre URL vue en cours ce lundi 2
url = "http://localhost:9200/clients/simple/client7"

# indiquer la nature de ce qu'on veut envoyer, si on retire ça, on a l'erreur 406
headers = {'content-type': 'application/json'}

# faire un json bien formé, sinon il faudrait le parser / faire valider avant de l'envoyer
load = {   "client7": [
 {
     "firstName": "Marcius",
     "lastName": "BOOL",
     "age": 32,
     "address":
       {
           "rue": "60 Rue des platane",
           "ville": "Boissy Saint Lourd",
           "CodePostal": "75008",
           "Pays": "France"
       },
     "NumeroTelephone": "33 07 48 70 77"
}]
}
# POST
r = requests.post(url, data=json.dumps(load), headers=headers)
print (r)
# ici code 200

# GET pour vérifier, se faire confirmer qu'on vient d'enregistrer ça
r1 = requests.get(url, headers=headers)
print (r1.content)