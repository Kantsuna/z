FROM back4app/nginx

# Instalando o Python
RUN apt-get update && apt-get install -y python3

# Copiando o script Python para o contêiner
COPY math_server.py /app/

# Expondo a porta 8080
EXPOSE 8080

# Comando para executar o servidor Python quando o contêiner for iniciado
CMD ["python3", "/app/math_server.py"]
