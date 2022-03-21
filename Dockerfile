FROM node:latest      
WORKDIR /app
COPY package*.json ./
COPY . /app
RUN env | grep -i proxy && npm cconfig set registry http://registry.npmjs.org/ --global
RUN npm install --loglevel verbose
EXPOSE 3000
CMD [ "node", "app.js"]
