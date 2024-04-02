import socket
import math

def handle_client(conn, math_server):
    while True:
        data = conn.recv(1024).decode().strip()
        if not data:
            break
        try:
            command, args = data.split(" ", 1)
            args = list(map(int, args.split()))
            if hasattr(math_server, command):
                func = getattr(math_server, command)
                result = func(*args)
            else:
                result = "Comando inválido"
        except Exception as e:
            result = str(e)
        
        conn.sendall(str(result).encode())

    conn.close()

def main():
    # Defina o host e a porta que o servidor irá escutar
    host = '0.0.0.0'  # Escutando em todas as interfaces disponíveis
    port = 8080

    # Carregando o arquivo math_server.py
    math_server = __import__('math_server')

    # Crie um socket TCP
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as server_socket:
        # Vincule o socket ao host e à porta especificados
        server_socket.bind((host, port))

        # Comece a escutar por conexões
        server_socket.listen(5)
        print(f"Servidor TCP ouvindo na porta {port}...")

        while True:
            # Aceite conexões recebidas
            client_socket, client_address = server_socket.accept()
            print(f"Conexão recebida de {client_address[0]}:{client_address[1]}")

            # Manipule a conexão do cliente em uma nova thread
            handle_client(client_socket, math_server)

if __name__ == "__main__":
    main()
