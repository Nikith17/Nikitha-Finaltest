# Use secure and slim Python image
FROM python:alpine

# Set working directory
WORKDIR /app

# Copy all project files into container
COPY . .

# Install dependencies
RUN pip install --no-cache-dir flask gunicorn

# Expose port Flask/Gunicorn will run on
EXPOSE 5000

# Run the app with Gunicorn for production
CMD ["gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "app:app"]
