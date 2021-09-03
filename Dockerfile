FROM node:14

# Create app directory
WORKDIR /home/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)

COPY package.json ./
COPY package-lock.json ./


RUN npm install
COPY server.js ./
COPY index.html ./
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source




EXPOSE 3000
CMD [ "node", "server.js" ]