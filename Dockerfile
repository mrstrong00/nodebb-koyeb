FROM node:20-alpine

WORKDIR /usr/src/nodebb

# System deps
RUN apk add --no-cache git python3 make g++

# Clone NodeBB
RUN git clone https://github.com/NodeBB/NodeBB.git .

# Install NodeBB (دي أهم خطوة)
RUN ./nodebb install --production

EXPOSE 4567

CMD ["./nodebb", "start"]
