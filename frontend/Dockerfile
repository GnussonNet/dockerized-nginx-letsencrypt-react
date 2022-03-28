FROM node:14-stretch-slim as build
WORKDIR /app
COPY . /app
RUN npm install && npm run build

FROM ubuntu:18.04

RUN apt update -y \
    && apt install nginx -y \
    && apt-get install software-properties-common -y \
    && add-apt-repository ppa:certbot/certbot -y \
    && apt-get update -y \
    && apt-get install python-certbot-nginx -y \
    && apt-get clean

COPY --from=build /app/build /var/www/html
EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]