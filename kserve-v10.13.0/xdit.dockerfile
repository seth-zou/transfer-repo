# Use the NVIDIA PyTorch base image
FROM nvcr.io/nvidia/pytorch:24.07-py3

# Install system dependencies
RUN apt-get update && apt-get install -y git && rm -rf /var/lib/apt/lists/*

# Update pip and install Python packages
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir xfuser flask

# Copy the application code
COPY ./http-service /app/http-service

# Set the working directory
WORKDIR /app

# Install application-specific dependencies if needed
# RUN pip install --no-cache-dir -r /app/http-service/requirements.txt

# Set the entrypoint and default command
ENTRYPOINT ["python", "/app/http-service/launch_host.py"]
CMD ["--config", "./http-service/config.json"]
