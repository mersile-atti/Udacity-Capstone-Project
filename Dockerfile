FROM node:lts-alpine
ARG APP_FOLDER="src"

WORKDIR /app

COPY . /$APP_FOLDER/ /app/
COPY . package*.json /app/
COPY . .
RUN npm install
EXPOSE 80
CMD ["npm", "run", "start"]