#Instalando dependencias de desarrollo
FROM node:19.2-alpine3.16 as deps
WORKDIR /app
COPY . .
RUN npm install

# Ejecutando los test
FROM node:19.2-alpine3.16 as builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run test

# Instalando dependencias de produccion
FROM node:19.2-alpine3.16 as prod-deps
WORKDIR /app
COPY package.json ./
RUN npm install --prod

# Ejecutar la APP
FROM node:19.2-alpine3.16 as runner
WORKDIR /app
COPY --from=prod-deps /app/node_modules ./node_modules
COPY app.js ./
COPY tasks/ ./tasks

# Run the app
CMD ["node", "app.js"]