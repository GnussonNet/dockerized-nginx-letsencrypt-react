# Dockerize React app inside Nginx using Let's Encrypt SSL certificate

## Deploy and setup certificate

```bash
docker-compose up -d
docker exec -it <frontend_container> bash
certbot --nginx -d domain.com -d www.domain.com
```
