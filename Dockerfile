# Base image: node:19.2-alpine3.16 and operative system: alpine3.16
# FROM --platform=linux/amd64 node:19.2-alpine3.16
FROM --platform=$BUILDPLATFORM node:19.2-alpine3.16

# Navigate to the app directory
WORKDIR /app

# Copy the all files to the app directory
COPY . .

# Install the dependencies
RUN npm install

# Create testing
RUN npm run test

# Delete files and directories that are not needed
RUN rm -rf tests && rm -rf node_modules

# Install the dependencies of the production environment
RUN npm install --prod

# Run the app
CMD ["node", "app.js"]