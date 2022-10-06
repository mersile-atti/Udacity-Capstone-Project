FROM node:lts-alpine

WORKDIR /app

COPY . /src/frontend /app/
COPY . package*.json /app/
COPY . .
RUN npm install && npm run build


FROM node:lts-alpine
ARG APP_FOLDER="src"

# Sets the Working Directory as "/server"
WORKDIR /app
# Copies the package.json file into "/server" and runs npm i
COPY . /$APP_FOLDER/ /app/
COPY . package*.json /app/
COPY . .
RUN npm install
# Copies the entire source code into "/server"

# Specifies the port the node app will be running on
EXPOSE 5000

# Runs "node server.js" after the above step is completed
CMD ["npm", "run", "server"]