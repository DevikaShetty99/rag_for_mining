#building the Docker image
FROM node:19-alpine3.16
#It will create a working directory for Docker. The Docker
#image will be created in this working directory.
WORKDIR /react-app
#Copy the React.js application dependencies from the 
#package.json to the react-app working directory.
COPY package.json .
COPY package-lock.json .
#install all the React.js application dependencies
RUN npm i
COPY . .
#Expose the React.js application container on port 3000
EXPOSE 3000
#The command to start the React.js application container
CMD ["npm", "start"]