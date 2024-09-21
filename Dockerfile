# Step 1: Use an official Python runtime as a parent image
FROM python:3.9-slim

# Step 2: Set the working directory
WORKDIR /app

# Step 3: Copy the current directory contents into the container
COPY . .

# Step 4: Install dependencies
RUN pip install Flask Flask-MySQL

# Step 5: Make port 5000 available to the world outside this container
EXPOSE 5000

# Step 6: Define environment variable
ENV FLASK_ENV=development

# Step 7: Run app.py when the container launches
CMD ["python", "app.py"]