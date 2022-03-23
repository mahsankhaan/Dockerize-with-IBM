FROM  ubi8/nodejs-12

WORKDIR /app
COPY package*.json ./
COPY . /app
RUN npm -v
RUN npm install --loglevel verbose
EXPOSE 3000
CMD [ "node", "app.js"]
