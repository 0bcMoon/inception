
all: volumes up

up:
	docker-compose up -d
down:
	docker-compose down
clean: down
	# docker stop $(shell docker ps -a -q)
	docker system prune -a --volumes


volumes:
	mkdir -p $(HOME)/goinfre/data/mariadb
	mkdir -p $(HOME)/goinfre/data/wordpress

# volumes:
# 	mkdir -p $(HOME)/mariadb
# 	mkdir -p $(HOME)/wordpress
