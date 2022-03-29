build-dev:
	docker-compose -f docker-compose.dev.yml up --build -d

stop-dev:
	docker-compose -f docker-compose.dev.yml down -v --rmi local

build-prod:
	docker-compose up --build -d

stop-prod:
	docker-compose down -v --rmi local

prebuild:
	docker-compose up --no-start

push:
	docker push ghcr.io/gnussonnet/dockerized-nginx-letsencrypt-react:latest

clean:
	docker system prune -a -f