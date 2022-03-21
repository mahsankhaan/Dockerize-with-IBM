FROM node:latest      
WORKDIR /app
COPY package*.json ./
COPY . /app
RUN npm cache clean --force && npm config set registry http://registry.npmjs.org/ --global
RUN npm install --loglevel verbose
EXPOSE 3000
CMD [ "node", "app.js"]
