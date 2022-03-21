FROM registry.access.redhat.com/ubi8/nodejs-12:1-50
WORKDIR /app
COPY package*.json ./
COPY . /app
RUN npm -v
RUN npm config set strict-ssl false
RUN npm install --loglevel verbose
EXPOSE 3000
CMD [ "node", "app.js"]
