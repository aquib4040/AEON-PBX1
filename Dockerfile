FROM python:3.11-slim

# Set working directory
WORKDIR /usr/src/app

# Give full permissions (only do this if absolutely necessary — not ideal for production)
RUN chmod 777 /usr/src/app

# Install system dependencies (e.g., bash if not available)
RUN apt-get update && apt-get install -y bash && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app files
COPY . .

# Set the default command
CMD ["bash", "start.sh"]
