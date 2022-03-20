FROM node:latest       
WORKDIR /app
COPY package*.json ./
COPY . /app
RUN npm config set registry http://registry.npmjs.org/
RUN npm install
EXPOSE 3000
CMD [ "node", "app.js"]
