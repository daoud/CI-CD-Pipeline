#FROM python:3.9
#COPY . /app
#WORKDIR /app
#RUN pip install -r requirements.txt
#EXPOSE $PORT
#CMD gunicorn --workers=4 --bind 0.0.0.0:$PORT app:app
# Run Gunicorn to serve the Flask app
#CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
# Use the official Python image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application files
COPY . .

# Expose port 5000
EXPOSE 5000

# Run Gunicorn to serve the Flask app
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
