# Use the Python 3.8 image
FROM python:3.8

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Expose the port the app runs on
EXPOSE 8080

# Run the application
CMD ["python", "math_server.py"]
