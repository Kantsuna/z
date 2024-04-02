import socket
import sqlite3
import math

# Função para calcular fatorial
def calcular_fatorial(n):
    return math.factorial(n)

# Função para calcular arranjo
def calcular_arranjo(n, r):
    return math.factorial(n) / math.factorial(n - r)

# Função para calcular combinação
def calcular_combinacao(n, r):
    return math.factorial(n) / (math.factorial(r) * math.factorial(n - r))

# Função para calcular permutação
def calcular_permutacao(n, r):
    return math.factorial(n) / math.factorial(n - r)

# Função para executar as operações com base na operação e nos argumentos fornecidos
def executar_operacao(operacao, args):
    if operacao == 'fatorial':
        return calcular_fatorial(*args)
    elif operacao == 'arranjo':
        return calcular_arranjo(*args)
    elif operacao == 'combinacao':
        return calcular_combinacao(*args)
    elif operacao == 'permutacao':
        return calcular_permutacao(*args)
    else:
        return 'Operação não suportada'

# Função principal para lidar com as conexões de cliente
def handle_client_connection(connection):
    with connection:
        while True:
            data = connection.recv(1024)
            if not data:
                break
            data = data.decode().strip().split()
            operacao = data[0]
            args = [int(arg) for arg in data[1:]]
            resultado = executar_operacao(operacao, args)
            connection.sendall(str(resultado).encode())

# Função principal para iniciar o servidor
def start_server(host, port):
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server_socket:
        server_socket.bind((host, port))
        server_socket.listen(1)
        print(f'Servidor TCP iniciado em {host}:{port}')
        while True:
            connection, address = server_socket.accept()
            print(f'Conexão estabelecida com {address}')
            handle_client_connection(connection)

if __name__ == "__main__":
    start_server('localhost', 8888)
