FROM node:latest      
WORKDIR /app
COPY package*.json ./
COPY . /app
RUN yum install openssl-devel cyrus-sasl -y
RUN npm install --loglevel verbose
EXPOSE 3000
CMD [ "node", "app.js"]
