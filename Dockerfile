FROM python:3.9-slim

EXPOSE 8080

CMD ["python", "/app/math_server.py"]
