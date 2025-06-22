FROM python:3.11-slim

WORKDIR /usr/src/app

# Install necessary system dependencies
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
    libattr1-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install Python dependencies
COPY requirements.txt .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt

# Copy the rest of the code
COPY . .

# Make start.sh executable
RUN chmod +x start.sh

# Set the command
CMD ["bash", "start.sh"]
