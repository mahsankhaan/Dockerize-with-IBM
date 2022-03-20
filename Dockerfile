FROM node:latest      
WORKDIR /app
COPY package*.json ./
COPY . /app
RUN npm install --loglevel verbose
EXPOSE 3000
CMD [ "node", "app.js"]
