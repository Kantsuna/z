const express = require('express');
const app = express();

// Função para calcular fatorial
function calcularFatorial(n) {
    return n === 0 ? 1 : n * calcularFatorial(n - 1);
}

// Função para calcular arranjo
function calcularArranjo(n, k) {
    return calcularFatorial(n) / calcularFatorial(n - k);
}

// Função para calcular combinação
function calcularCombinação(n, k) {
    return calcularFatorial(n) / (calcularFatorial(k) * calcularFatorial(n - k));
}

// Função para calcular permutação
function calcularPermutação(n) {
    return calcularFatorial(n);
}

// Rota para calcular fatorial
app.get('/fatorial/:n', (req, res) => {
    const n = parseInt(req.params.n);
    const resultado = calcularFatorial(n);
    res.json({ resultado });
});

// Rota para calcular arranjo
app.get('/arranjo/:n/:k', (req, res) => {
    const n = parseInt(req.params.n);
    const k = parseInt(req.params.k);
    const resultado = calcularArranjo(n, k);
    res.json({ resultado });
});

// Rota para calcular combinação
app.get('/combinacao/:n/:k', (req, res) => {
    const n = parseInt(req.params.n);
    const k = parseInt(req.params.k);
    const resultado = calcularCombinação(n, k);
    res.json({ resultado });
});

// Rota para calcular permutação
app.get('/permutacao/:n', (req, res) => {
    const n = parseInt(req.params.n);
    const resultado = calcularPermutação(n);
    res.json({ resultado });
});

// Iniciar o servidor
const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Servidor está ouvindo na porta ${port}`);
});
