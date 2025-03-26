
all: up

up:
	docker-compose up -d
down:
	docker-compose down
clean: down
	# docker stop $(shell docker ps -a -q)
	docker system prune -a --volumes
