FROM node:lts-alpine
ARG APP_FOLDER="src"

WORKDIR /app

COPY . /$APP_FOLDER/ /app/
COPY . package*.json /app/
COPY . package-lock.json /app/
RUN npm install
EXPOSE 8000
CMD ["npm", "run", "start"]