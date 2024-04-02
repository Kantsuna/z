from flask import Flask, request
import math

app = Flask(__name__)

@app.route('/factorial')
def factorial():
    n = int(request.args.get('n'))
    result = math.factorial(n)
    return str(result)

@app.route('/permutation')
def permutation():
    n = int(request.args.get('n'))
    r = int(request.args.get('r'))
    result = math.perm(n, r)
    return str(result)

@app.route('/combination')
def combination():
    n = int(request.args.get('n'))
    r = int(request.args.get('r'))
    result = math.comb(n, r)
    return str(result)

@app.route('/arrangement')
def arrangement():
    n = int(request.args.get('n'))
    r = int(request.args.get('r'))
    result = math.perm(n, r)
    return str(result)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
