#Multi-step build
#as builder - we assign the name of the first stage
FROM node:alpine as builder
WORKDIR '/app'
#run npm install in order to install dependencies
COPY package.json .
RUN npm install
#copy /app folder contents in order to use all files there
COPY . .
#build the app
RUN npm run build

#2nd phase - download nginx imageand start it
#Get nginx image
FROM nginx
#Copy --from=builder - get and copy contents of /app/build directory from the first builder phase image and paste it inside /usr/share/nginx/html folder
COPY --from=builder /app/build /usr/share/nginx/html
#nginx will start automatically we don't need to specify command
#we need to run nginx with docker run -p port:80 command + image id
