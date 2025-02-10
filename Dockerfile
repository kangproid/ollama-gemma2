# Use the official Ollama image
FROM ollama/ollama

# Install curl
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Start Ollama in the background and wait until it's ready before pulling the model
RUN ollama serve & \
    while ! curl -s http://localhost:11434 >/dev/null; do sleep 1; done && \
    ollama pull gemma:2b

# Expose the default Ollama port
EXPOSE 11434

# Start the Ollama server
CMD ["ollama", "serve"]
