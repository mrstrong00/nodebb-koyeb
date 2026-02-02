FROM node:20-alpine

WORKDIR /usr/src/nodebb

RUN apk add --no-cache git python3 make g++

RUN git clone --depth 1 https://github.com/NodeBB/NodeBB.git .

RUN npm install --production

EXPOSE 4567

CMD ["node", "app.js"]
