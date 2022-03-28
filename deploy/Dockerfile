FROM node:alpine as build
WORKDIR /app
COPY ../frontend /app
RUN npm install && npm run build

FROM ubuntu:20.04

RUN apt update -y \
    && apt install nginx curl vim -y \
    && apt-get install software-properties-common -y \
    && add-apt-repository ppa:certbot/certbot -y \
    && apt-get update -y \
    && apt-get install python-certbot-nginx -y \
    && apt-get clean

COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]