# Use Node.js 20 on Alpine Linux
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apk add --no-cache git python3 make g++

# Clone NodeBB directly into /app
RUN git clone https://github.com/NodeBB/NodeBB.git /app

# Verify that package.json exists (optional, for debugging)
RUN test -f /app/package.json

# Install NodeBB dependencies (omit dev)
RUN npm install --omit=dev

# Expose NodeBB default port
EXPOSE 4567

# Run NodeBB loader to start the app
CMD ["node", "loader.js"]
