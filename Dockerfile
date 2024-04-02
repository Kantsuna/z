FROM python:3.9-slim

# Copie o arquivo math_server.py para o contêiner
COPY math_server.py /app/

# Exponha a porta 8080
EXPOSE 8080

# Comando para executar o servidor Python quando o contêiner for iniciado
CMD ["python", "/app/math_server.py"]
