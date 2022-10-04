FROM node:16.13.0 AS builder
USER root
RUN apt-get update && apt-get install -y lsb-release
WORKDIR /dist
COPY ./package.json ./
COPY ./package-lock.json ./
COPY . .
RUN npm ci
EXPOSE 8000
CMD [“npm”, “run”, “start”]