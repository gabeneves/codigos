### UFMT - Ciencia da Computacao
### Topicos Avancados de Engenharia de software
### Professor Thiago Pereira Silva
### Alunos: Gabriel Neves Silveira, Guilherme Queiroz Ribas
###
### Codigo fonte do dummy device sensor 2 da tia do acai

# Bibliotecas
import requests
import re
import time
import random
from flask import Flask, request, make_response

# Criacao do servidor http com flask
app = Flask(__name__)

# Variaveis globais utilizadas para enviar informacao de hora e quantidade de pessoas presentes
horario = 0
quantidade = 0

# Funcao que envia os dados do dummy device para o iot agent infinitamente, enquanto nao for derrubado
def sendData():
    while True:
        global horario, quantidade # Utilizacao do horario e quantidade criado fora da funcao
        

        # Logica que simula o horario que geralmente pessoas estao presentes no lugar
        if (14 <= horario <= 17):
            quantidade = random.randint(5, 15)

        else:
            quantidade = 0
        

        horario += 1 # incrementa o horario a cada vez que eh chamado

        if (horario == 24): # Caso o horario seja meia noite, eh voltado para zero
            horario = 0

        # URL para o dummy enviar para o iot agent ultralight
        url = "http://fiware-iot-agent:7896/iot/d?k=4jggokgpepnvsb2uv4s40d59ov&i=sensor002"

        payload = f"quantidade|{quantidade}|horario|Horas: {horario}" # Dado em ultralight enviado pelo dummy

        # Cabecalho que serah enviado pelo dummy
        headers = {
            "fiware-service": 'openiot',
            "fiware-servicepath": '/',
            'Content-type': 'text/plain'
        }
        
        # Tenta enviar os dados e retorna o status do envio
        try:
            response = requests.post(url, data=payload, headers=headers)
            print(f"Status code: {response.status_code}")
        except:
            print("Error sending the message")

        time.sleep(10) # Envia um novo dado a cada 10 segundos

if __name__ == "__main__":
    sendData()