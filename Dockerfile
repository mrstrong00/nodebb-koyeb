FROM node:20-alpine

WORKDIR /usr/src/nodebb

RUN apk add --no-cache git python3 make g++

RUN git clone https://github.com/NodeBB/NodeBB.git .

RUN npm install --production

ENV NODE_ENV=production
ENV PORT=4567

EXPOSE 4567

CMD ["./nodebb", "start"]
