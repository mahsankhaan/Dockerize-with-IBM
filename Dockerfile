FROM registry.access.redhat.com/ubi8/nodejs-12:1-50

ENV http_proxy=""
ENV https_proxy=""
ENV HTTPS_PROXY=""

WORKDIR /app
COPY package*.json ./
COPY . /app
RUN npm -v
RUN npm install --loglevel verbose
EXPOSE 3000
CMD [ "node", "app.js"]
