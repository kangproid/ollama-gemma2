# Use the official Ollama image
FROM ollama/ollama

# Install curl
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Expose the default Ollama port
EXPOSE 11434

# Ensure the model is pulled when the container starts
CMD ["sh", "-c", "ollama serve & while ! curl -s http://localhost:11434 >/dev/null; do sleep 1; done && ollama pull gemma:2b && tail -f /dev/null"]
