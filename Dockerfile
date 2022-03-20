FROM node:alphine      
WORKDIR /app
COPY package*.json ./
COPY . /app
RUN npm install
EXPOSE 3000
CMD [ "node", "app.js"]
