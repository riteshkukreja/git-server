# Node 8.9 version is supported by GIT-SERVER
# It also comes with gcc installed
FROM node:8

LABEL PROJECT="GIT-SERVER"

# Copy all the source files to container
# Mounting doesn't work as symlink cannot be made inside mounted volume
COPY lib /home/app/lib
COPY repos /home/app/repos
COPY config.js /home/app/
COPY index.js /home/app/
COPY package.json /home/app/

# Change workdir so that upcoming commands are shorter
WORKDIR /home/app

# Set the node environment to install only production dependencies
ENV NODE_ENV=production

# Install all the production dependencies
RUN yarn install

# Port 5000 will be used for HTTP server
EXPOSE 5000

# Start the application
ENTRYPOINT npm start