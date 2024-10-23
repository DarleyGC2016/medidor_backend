FROM node:lts-alpine
ENV NODE_ENV=production
WORKDIR /darley-pc/node/app
COPY ["package.json", "package-lock.json*", "npm-shrinkwrap.json*", "./"]
RUN npm install --production --silent && mv node_modules ../
COPY . .
EXPOSE 3000
RUN chown -R node /darley-pc/node/app
USER node
CMD ["node", "index.js"]
