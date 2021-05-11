FROM node:alpine

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

CMD ["npm", "run", "start"]

#command to run volumes in powershell
#docker run -it -p 3000:3000 -v /app/node_modules -v C:\Users\barto\OneDrive\Pulpit\dockerprojects\react\frontend:/app -e CHOKIDAR_USEPOLLING=true b
 #1512fe2fa78