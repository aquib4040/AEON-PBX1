FROM python:3.11-slim

WORKDIR /usr/src/app

# Install required system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    bash \
    build-essential \
    gcc \
    libffi-dev \
    libssl-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libjpeg-dev \
    libmagic-dev \
    python3-dev \
    git \
    xz-utils \
    libcap2-bin \
    libxattr1 \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy application code
COPY . .

# Ensure start.sh is executable
RUN chmod +x start.sh

# Run your app
CMD ["bash", "start.sh"]
