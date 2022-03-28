# Dockerize React app inside Nginx using Let's Encrypt SSL certificate

## Deplay and ssetup certificate

```bash
docker-compose up -d
docker exec -it <frontend_container> bash
certbot --nginx -d domain.com -d www.domain.com
```
