const net = require('net');

const server = net.createServer((socket) => {
    console.log('Cliente conectado');

    socket.on('data', (data) => {
        const requestData = data.toString().trim();
        console.log('Recebido:', requestData);

        const [operation, ...args] = requestData.split(' ');
        const result = calculate(operation, args.map(arg => parseInt(arg)));

        socket.write(result.toString());
    });

    socket.on('end', () => {
        console.log('Cliente desconectado');
    });
});

server.listen(3000, () => {
    console.log('Servidor TCP rodando na porta 3000');
});

function calculate(operation, args) {
    switch (operation) {
        case 'factorial':
            return factorial(args[0]);
        case 'permutation':
            return permutation(args[0], args[1]);
        case 'combination':
            return combination(args[0], args[1]);
        case 'arrangement':
            return arrangement(args[0], args[1]);
        default:
            return 'Operação não suportada';
    }
}

function factorial(n) {
    if (n === 0 || n === 1) {
        return 1;
    }
    return n * factorial(n - 1);
}

function permutation(n, r) {
    return factorial(n) / factorial(n - r);
}

function combination(n, r) {
    return factorial(n) / (factorial(r) * factorial(n - r));
}

function arrangement(n, r) {
    return factorial(n) / factorial(n - r);
}
