FROM node:16.13.0 AS builder
WORKDIR /dist
COPY ./package.json ./
COPY ./package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8000
CMD [“npm”, “run”, “start”]