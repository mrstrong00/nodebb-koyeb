FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache git python3 make g++

RUN git clone https://github.com/NodeBB/NodeBB.git .

EXPOSE 4567

CMD ["./nodebb", "start"]
