FROM node:16.13.0 AS builder
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8000
CMD [ "npm", "start" ]