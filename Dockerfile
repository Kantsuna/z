FROM python:3.9-slim

WORKDIR /app

# Instalando dependências (se houver)
RUN pip install math

# Copiando o script do servidor Python para o contêiner
COPY math_server.py .

# Expondo a porta que o servidor estará ouvindo
EXPOSE 12345

# Comando para iniciar o servidor quando o contêiner for executado
CMD ["python", "math_server.py"]
