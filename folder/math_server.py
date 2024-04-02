# math_server.py
import socket
import math

def factorial(n):
    return math.factorial(n)

def arrangement(n, k):
    return math.perm(n, k)

def combination(n, k):
    return math.comb(n, k)

def permutation(n, k):
    return math.perm(n, k)

def handle_client(conn):
    while True:
        data = conn.recv(1024).decode().strip()
        if not data:
            break
        try:
            command, args = data.split(" ", 1)
            args = list(map(int, args.split()))
            if command == "factorial":
                result = factorial(*args)
            elif command == "arrangement":
                result = arrangement(*args)
            elif command == "combination":
                result = combination(*args)
            elif command == "permutation":
                result = permutation(*args)
            else:
                result = "Comando inválido"
        except Exception as e:
            result = str(e)
        
        conn.sendall(str(result).encode())

    conn.close()

def main():
    host = '0.0.0.0'  # Todas as interfaces disponíveis
    port = 8080

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.bind((host, port))
        s.listen(1)
        print(f"Servidor TCP ouvindo na porta {port}...")

        while True:
            conn, addr = s.accept()
            print(f"Conexão recebida de {addr[0]}:{addr[1]}")
            handle_client(conn)

if __name__ == "__main__":
    main()
