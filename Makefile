NAME        = inception
SRCS        = srcs/docker-compose.yml
HOST_WP_DIR = /home/mmasubuc/data/wordpress
HOST_DB_DIR = /home/mmasubuc/data/db

all: clean up

up:
	@sudo mkdir -p $(HOST_WP_DIR)
	@sudo mkdir -p $(HOST_DB_DIR)
	@sudo sh srcs/requirements/tools/addhost.sh
	sudo docker-compose -f $(SRCS) up -d --build

stop:
	sudo docker-compose -f $(SRCS) down

clean: stop
	sudo rm -rf $(HOST_WP_DIR)
	sudo rm -rf $(HOST_DB_DIR)
	sudo docker-compose -f $(SRCS) down --rmi all --volumes --remove-orphans

state:
	sudo docker-compose -f $(SRCS) ps

log-wp:
	sudo docker logs -f --tail 50 -t wordpress

log-db:
	sudo docker logs -f --tail 50 -t mariadb

log-server:
	sudo docker logs -f --tail 50 -t nginx

.PHONY: all up stop clean state log-wp log-db log-server
