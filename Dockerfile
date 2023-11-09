# Build: docker build -t router .
# Run:   docker run -t -i -p 4000:4000 router

# Use an official Node.js runtime as base image
## use Node bullseye, mtfr: https://github.com/nodejs/node/issues/43064
FROM node:18-bullseye

RUN mkdir -p /service/router

WORKDIR /service/router

# Copy package.json and package-lock.json to the working directory
#COPY package*.json ./

# Copy the rest of the application code to the working directory
COPY . .

# Install Node.js dependencies
# install router
# import the graphs - this requires back-end servers are running FIRST
#RUN ./scripts/download-router.sh
#RUN npm run prepare
RUN npm install 
#&& npm run import:all:compose

# Expose the port that the application will run on
EXPOSE 4000 8088

# Define the command to start the application
CMD ["npm", "run", "start"]