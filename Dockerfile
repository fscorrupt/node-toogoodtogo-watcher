FROM node:14
LABEL maintainer=fscorrupt
LABEL org.opencontainers.image.source https://github.com/fscorrupt/node-toogoodtogo-watcher

WORKDIR /home/node/app
COPY package*.json ./
RUN npm ci --production
COPY . .
RUN mkdir -p /home/node/.config/toogoodtogo-watcher-nodejs && \
    chown -R node:node /home/node/
USER node
VOLUME /home/node/.config/toogoodtogo-watcher-nodejs
CMD [ "node", "index.js", "watch" ]
