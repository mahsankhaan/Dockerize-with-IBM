FROM registry.access.redhat.com/ubi8/nodejs-12:1-50
USER root
RUN npm config rm proxy && npm config rm https-proxy
RUN npm cache clean --force && npm config set registry https://registry.npmjs.org/
RUN npm config set strict-ssl false
WORKDIR /app
COPY package*.json ./
COPY . /app
RUN npm -v
RUN npm install --loglevel verbose
EXPOSE 3000
CMD [ "node", "app.js"]
