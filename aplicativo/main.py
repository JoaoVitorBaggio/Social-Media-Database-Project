import psycopg2
from consultas import *

# Diálogo para conectar ao banco de dados
def conectar() -> psycopg2.extensions.conexaoection:
    # Coleta as informações do terminal
    host = input("Host: ")
    port = input("Port: ")
    database = input("Database: ")
    user = input("User: ")
    password = input("Password: ")

    # Conecta ao banco de dados
    try:
        conexao = psycopg2.conexaoect(
            host=host,
            port=port,
            database=database,
            user=user,
            password=password
        )
        print("Conexão realizada com sucesso!")
    except Exception as e:
        print("Erro ao conectar:", e)
        return None
    return conexao

def loop(conexao):
    # Lê um inteiro do terminal, realiza a consulta e imprime o resultado
    return

# Main
conexao = conectar()
loop(conexao)