
all: up

up: volumes
	DOCKER_BUILDKIT=1 COMPOSE_DOCKER_CLI_BUILD=1 docker-compose up -d --build --parallel
down:
	docker-compose down

volumes:
	mkdir -p /home/hibenouk/data/mariadb
	mkdir -p /home/hibenouk/data/wordpress
	mkdir -p /home/hibenouk/data/adminer

.IGNORE:
fclean: 
	docker stop $(shell docker ps -a -q)
	docker rm  -f $(shell docker ps -a -q)
	docker rmi -f $(shell docker images -a -q)
	docker volume rm -f $(shell docker volume ls -q)
	sudo rm -rf /home/hibenouk/data
