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

def handle_request(request):
    try:
        function, params = request.split(':')
        params = [int(param) for param in params.split(',')]
        if function == 'factorial':
            result = factorial(*params)
        elif function == 'permutation':
            result = permutation(*params)
        elif function == 'combination':
            result = combination(*params)
        elif function == 'arrangement':
            result = arrangement(*params)
        else:
            result = "Invalid function"
    except Exception as e:
        result = str(e)
    return str(result)

def main():
    host = '0.0.0.0'
    port = 8080

    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
        s.bind((host, port))
        s.listen(5)
        print(f"Server listening on {host}:{port}...")
        while True:
            conn, addr = s.accept()
            with conn:
                print(f"Connected by {addr}")
                data = conn.recv(1024).decode('utf-8')
                result = handle_request(data)
                conn.sendall(result.encode('utf-8'))

if __name__ == "__main__":
    main()
