# Base lightweight node image
FROM node:21-alpine3.18

# Creating our workdir + moving necessary files
COPY . /app
WORKDIR /app

# Elevated priviliges
USER root

# Installing node dependencies
RUN npm install

# node.js server initialization
CMD ["npm", "start"]