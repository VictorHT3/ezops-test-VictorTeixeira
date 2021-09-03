FROM node:14

# Create app directory
RUN mkdir -p /app
WORKDIR /app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)

COPY . ./app
COPY .env ./app

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source
COPY . .
COPY init.sh /init.sh
RUN chmod +x /init.sh
ENTRYPOINT [ "/init.sh" ]


EXPOSE 3000
CMD [ "node", "server.js" ]