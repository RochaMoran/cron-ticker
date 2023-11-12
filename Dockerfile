# Base image: node:19.2-alpine3.16 and operative system: alpine3.16
FROM node:19.2-alpine3.16

# Navigate to the app directory
WORKDIR /app

# Copy the package.json file to the app directory
COPY app.js package.json ./

# Install the dependencies
RUN npm install

# Run the app
CMD ["node", "app.js"]