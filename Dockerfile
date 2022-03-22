FROM registry.access.redhat.com/ubi8/nodejs-12:1-50
RUN npm config set proxy https://registry.npmjs.org/ && npm config set https-proxy http://registry.npmjs.org/ && unset HTTP_PROXY && unset HTTPS_PROXY
WORKDIR /app
COPY package*.json ./
COPY . /app
RUN npm -v
RUN npm install --loglevel verbose
EXPOSE 3000
CMD [ "node", "app.js"]
