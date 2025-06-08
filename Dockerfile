#stage 1 Use an officical node runtime as a parent image
FROM node:18-alpine

#set the working directory in the container
WORKDIR /usr/src/app        

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./   

# Install dependencies
RUN npm install --omit=dev  

# Copy the rest of the application code to the working directory
COPY . .    

# Expose the port the app runs on
EXPOSE 3000 

# Define the command to run the app
CMD ["node", "src/index.js"]