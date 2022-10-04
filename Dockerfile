# Official jenkins image
FROM jenkins/jenkins:lts
# Swith to root to be able to install Docker and modify permissions
USER root
RUN apt-get update
# Install docker
RUN curl -sSL https://get.docker.com/ | sh
# Add jenkins user to docker group
RUN usermod -a -G docker jenkins
# Switch back to default user
USER jenkins

# Bild the image:
# sudo docker build -t yourusername/imagename .
# Run the image and mount with the followin bind mount option:
# sudo docker run --name imagename -d -p8080:8080 -v /var/run/docker.sock:/var/run/docker.sock yourusername/imagename

FROM node:lts-alpine
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 8000
CMD [ "npm", "start" ]