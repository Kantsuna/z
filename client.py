import socket
import time

# Configurações do cliente
HOST = '127.0.0.1'  # Endereço do servidor
PORT = 12345        # Porta do servidor

# Criação do socket UDP
client_socket = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# Loop para enviar 1000 mensagens
for i in range(1000):
    # Marca o tempo de criação da mensagem
    creation_time = time.strftime("%H:%M:%S", time.localtime())
    # Cria a mensagem com o tempo de criação
    message = f"Mensagem {i+1} criada em {creation_time}"
    # Envia a mensagem para o servidor
    client_socket.sendto(message.encode(), (HOST, PORT))

# Fecha o socket do cliente
client_socket.close()
