FROM python:3.8-slim-bullseye

# Set work directory
WORKDIR /app

# Install required system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    unzip \
    ca-certificates \
    gnupg \
    lsb-release \
    awscli && \
    rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /app

# Install Python dependencies
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install --no-cache-dir --upgrade accelerate
RUN pip uninstall -y transformers accelerate && \
    pip install --no-cache-dir transformers accelerate

# Run the app
CMD ["python3", "app.py"]
