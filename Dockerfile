#  Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container
COPY . .

#  Install dependencies
RUN pip install Flask Flask-MySQL

# Install dependencies for mysqlclient
RUN apt-get update && apt-get install -y \
    python3-dev \
    default-libmysqlclient-dev \
    build-essential \
    pkg-config

# Install Python dependencies
RUN pip install mysqlclient

#  Make port 5000 available to the world outside this container
EXPOSE 5000

#  Define environment variable
ENV FLASK_ENV=development

#  Run app.py when the container launches
CMD ["python", "app.py"]