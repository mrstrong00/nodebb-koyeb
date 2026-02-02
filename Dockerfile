FROM node:20-alpine

WORKDIR /usr/src/nodebb

# Dependencies
RUN apk add --no-cache git python3 make g++

# Clone NodeBB
RUN git clone https://github.com/NodeBB/NodeBB.git .

# Install NodeBB deps (الطريقة الصح)
RUN npm install --omit=dev

# Build NodeBB
RUN ./nodebb build

EXPOSE 4567

CMD ["./nodebb", "start"]
