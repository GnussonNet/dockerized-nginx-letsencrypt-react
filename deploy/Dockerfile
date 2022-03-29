#
# Bulder for production image
#
FROM node:14-alpine as build
# Working directory
WORKDIR /app
# Copy frontend to /app
COPY ./frontend /app
# Install and build application
RUN npm install && npm run build


#
# Production image
#
# Ubuntu 18.04 is needed becaus 20.04 does not support certbot istallation via apt-get
FROM ubuntu:18.04 as production
# Install nginx and certbot
RUN apt update -y \
    && apt install nginx -y \
    && apt-get install software-properties-common -y \
    && add-apt-repository ppa:certbot/certbot -y \
    && apt-get update -y \
    && apt-get install python-certbot-nginx -y \
    && apt-get clean
# Copy files from builder to nginx folder
COPY --from=build /app/build /var/www/html
# Expose port 80 for nginx
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]


#
# Development image
#
FROM node:14-alpine as development
# Development enviroment variable
ENV NODE_ENV development
# Working directory
WORKDIR /app
# Cache and build dependencies
COPY ./frontend/package.json .
COPY ./frontend/package-lock.json .
RUN npm install
# Copy frontend to /app
COPY ./frontend/ .
# Expose port 3000
EXPOSE 3000
# Start development application
CMD [ "npm", "start" ]