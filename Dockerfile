FROM node:lts-alpine
WORKDIR /app
COPY package*.json ./
COPY package-lock.json ./
COPY ./ ./
RUN npm install
EXPOSE 8000
CMD ["npm", "run", "start"]