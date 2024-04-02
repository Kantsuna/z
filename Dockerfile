import back4app
import socket
import threading
import math

# Defina as credenciais do back4app
back4app.initialize("your_app_id", "your_rest_key")
back4app.connect()

# Funções matemáticas
def fatorial(n):
    return math.factorial(n)

def arranjo(n, k):
    return math.factorial(n) / math.factorial(n - k)

def combinacao(n, k):
    return math.factorial(n) / (math.factorial(k) * math.factorial(n - k))

def permutacao(n, k):
    return math.factorial(n) / math.factorial(n - k)

# Função de tratamento de conexão
def handle_connection(client_socket):
    print("Conexão estabelecida com:", client_socket)
    while True:
        # Recebe os dados do cliente
        data = client_socket.recv(1024).decode("utf-8")
        if not data:
            break

        # Parseia a mensagem recebida
        try:
            operacao, args = data.split(":")
            args = [int(arg) for arg in args.split(",")]
        except ValueError:
            client_socket.send("Erro: Formato de mensagem inválido.".encode("utf-8"))
            continue

        # Executa a operação solicitada
        if operacao == "fatorial":
            resultado = fatorial(*args)
        elif operacao == "arranjo":
            resultado = arranjo(*args)
        elif operacao == "combinacao":
            resultado = combinacao(*args)
        elif operacao == "permutacao":
            resultado = permutacao(*args)
        else:
            resultado = "Erro: Operação não suportada."

        # Envia o resultado de volta para o cliente
        client_socket.send(str(resultado).encode("utf-8"))

    # Fecha o socket do cliente
    client_socket.close()

# Configurações do servidor
HOST = "127.0.0.1"
PORT = 12345

# Inicializa o socket do servidor
server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server_socket.bind((HOST, PORT))
server_socket.listen(5)

print("Servidor TCP está esperando por conexões...")

# Loop principal para lidar com as conexões
while True:
    # Aceita uma nova conexão
    client_socket, addr = server_socket.accept()

    # Inicia uma nova thread para lidar com a conexão
    client_handler = threading.Thread(target=handle_connection, args=(client_socket,))
    client_handler.start()
