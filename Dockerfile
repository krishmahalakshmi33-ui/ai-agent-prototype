# Use the official Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy files and install dependencies
COPY . .
RUN pip install --no-cache-dir -r requirements.txt

# Run the web service on container startup
# 'main:app' refers to the 'app' object in your 'main.py' file
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app
