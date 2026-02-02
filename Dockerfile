FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache git python3 make g++

# Clone NodeBB
RUN git clone https://github.com/NodeBB/NodeBB.git .

# Install dependencies first
RUN npm install --omit=dev

EXPOSE 4567

# Run NodeBB installer and then start
CMD ["sh", "-c", "./nodebb setup --cli && ./nodebb start"]
