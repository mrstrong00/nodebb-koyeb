FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache git python3 make g++

RUN git clone https://github.com/NodeBB/NodeBB.git .

# Force NodeBB to install deps during build
RUN ./nodebb install --ci --skip-build

EXPOSE 4567

CMD ["./nodebb", "start"]
