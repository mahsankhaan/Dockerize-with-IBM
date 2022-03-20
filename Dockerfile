FROM node:latest       
WORKDIR /app
COPY package*.json ./
COPY . /app
ENV HTTP_PROXY http://aidocbuilder.dev:8443
ENV HTTPS_PROXY http://aidocbuilder.dev:8443
RUN npm install
EXPOSE 3000
CMD [ "node", "app.js"]
