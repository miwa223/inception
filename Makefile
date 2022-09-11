NAME        = inception
SRCS        = srcs/docker-compose.yml
HOST_WP_DIR = /home/mmasubuc/data/wordpress
HOST_DB_DIR = /home/mmasubuc/data/mariadb

all: clean up

up:
	@sudo mkdir -p $(HOST_WP_DIR)
	@sudo mkdir -p $(HOST_DB_DIR)
	@sudo sh srcs/requirements/tools/addhost.sh
	docker-compose -f $(SRCS) up -d --build

stop:
	docker-compose -f $(SRCS) down 2>/dev/null

clean: stop
	@sudo sh srcs/requirements/tools/removehost.sh
	sudo rm -rf $(HOST_WP_DIR)
	sudo rm -rf $(HOST_DB_DIR)
	docker-compose -f $(SRCS) down --rmi all --volumes --remove-orphans 2>/dev/null

state:
	@docker-compose -f $(SRCS) ps

log-wp:
	@docker logs -f --tail 50 -t wordpress

log-db:
	@docker logs -f --tail 50 -t mariadb

log-nginx:
	@docker logs -f --tail 50 -t nginx

.PHONY: all up stop clean state log-wp log-db log-nginx
