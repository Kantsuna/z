import socket
import math

def factorial(n):
    return math.factorial(n)

def permutation(n, r):
    return math.perm(n, r)

def combination(n, r):
    return math.comb(n, r)

def arrangement(n, r):
    return math.perm(n, r)

def handle_client_connection(client_socket):
    while True:
        request = client_socket.recv(1024).decode('utf-8')
        if not request:
            break
        
        parts = request.split()
        if len(parts) != 3:
            response = "Invalid request. Please provide function and arguments."
        else:
            try:
                function = parts[0]
                arg1 = int(parts[1])
                arg2 = int(parts[2])

                if function == "factorial":
                    result = factorial(arg1)
                elif function == "permutation":
                    result = permutation(arg1, arg2)
                elif function == "combination":
                    result = combination(arg1, arg2)
                elif function == "arrangement":
                    result = arrangement(arg1, arg2)
                else:
                    result = "Invalid function."
                
                response = str(result)
            except Exception as e:
                response = f"Error: {e}"

        client_socket.send(response.encode('utf-8'))

def start_server():
    server_socket = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    server_socket.bind(('0.0.0.0', 12345))
    server_socket.listen(5)
    print("Math server is listening on port 12345...")
    while True:
        client_socket, _ = server_socket.accept()
        handle_client_connection(client_socket)

if __name__ == "__main__":
    start_server()
