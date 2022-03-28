FROM node:alpine as build
WORKDIR /app
COPY . /app
RUN npm install && npm run build

FROM ubuntu:20.04

# RUN apt update -y \
#     && apt install nginx curl vim -y \
#     && apt-get install software-properties-common -y \
#     && apt-add-repository -r ppa:certbot/certbot -y \
#     && apt-get update -y \
#     && apt-get install python-certbot-nginx -y \
#     && apt-get clean

RUN apt update -y \
        && apt install python3 python3-venv libaugeas0 -y \
        && dnf install python3 augeas-libs \
        && python3 -m venv /opt/certbot/ \
        && /opt/certbot/bin/pip install --upgrade pip \
        && /opt/certbot/bin/pip install certbot certbot-nginx \
        && ln -s /opt/certbot/bin/certbot /usr/bin/certbot \
        && apt-get clean

COPY --from=build /app/build /var/www/html
EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]