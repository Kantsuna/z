FROM python:3.9-slim

# Crie um diretório de trabalho no contêiner
WORKDIR /math_server

# Copie o arquivo math_server.py para o contêiner
COPY . /app/

# Exponha a porta 8080
EXPOSE 8080

# Comando para executar o servidor Python quando o contêiner for iniciado
CMD ["python", "math_server.py"]
