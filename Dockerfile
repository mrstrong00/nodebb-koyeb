FROM node:20-alpine

WORKDIR /app

# Install system dependencies
RUN apk add --no-cache git python3 make g++ bash curl

# Clone official NodeBB repo (latest stable)
RUN git clone --depth 1 https://github.com/NodeBB/NodeBB.git /app

# Install NodeBB dependencies
RUN npm install --omit=dev

# Expose NodeBB default port
EXPOSE 4567

# Start NodeBB
CMD ["sh", "-c", "./nodebb setup && ./nodebb start"]
