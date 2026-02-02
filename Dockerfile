# Base image
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install system dependencies required for NodeBB
RUN apk add --no-cache git python3 make g++ bash curl

# Clone the official NodeBB repository (latest stable)
RUN git clone --depth 1 https://github.com/NodeBB/NodeBB.git /app

# Install NodeBB dependencies (production only)
RUN npm install --omit=dev

# Expose NodeBB default port
EXPOSE 4567

# Automatically run NodeBB setup if needed, then start NodeBB
CMD ["sh", "-c", "if [ ! -f config.json ]; then ./nodebb setup; fi && ./nodebb start"]
