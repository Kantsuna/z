import socket
import math

def calculate_function(data):
    parts = data.split(',')
    if len(parts) < 2:
        return "Erro: Não há argumentos suficientes."
    try:
        operation = parts[0]
        values = list(map(int, parts[1:]))
        if operation == "fatorial":
            result = math.factorial(values[0])
        elif operation == "arranjo":
            result = math.perm(values[0], values[1])
        elif operation == "combinação":
            result = math.comb(values[0], values[1])
        elif operation == "permutação":
            result = math.perm(values[0])
        else:
            return "Erro: Operação inválida."
        return str(result)
    except ValueError:
        return "Erro: Argumentos inválidos."

def main():
    host = '127.0.0.1'
    port = 12345

    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind((host, port))
    server_socket.listen(5)

    print("Servidor TCP está em execução...")

    while True:
        client_socket, addr = server_socket.accept()
        print("Conexão recebida de:", addr)

        data = client_socket.recv(1024).decode()
        print("Dados recebidos:", data)

        response = calculate_function(data)

        print("Resultado:", response)

        client_socket.send(response.encode())

        client_socket.close()

if __name__ == "__main__":
    main()
