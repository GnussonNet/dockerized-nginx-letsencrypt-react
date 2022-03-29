build-dev:
	docker-compose -f docker-compose.dev.yml up -d

prebuild:
	docker-compose up --no-start

push:
	docker push ghcr.io/gnussonnet/dockerized-nginx-letsencrypt-react:latest