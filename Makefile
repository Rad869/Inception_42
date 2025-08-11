# Makefile for Docker Compose project

# Variables
NAME = inception
DOCKER_COMPOSE = docker compose
COMPOSE_FILE = ./srcs/docker-compose.yml

# Default target
all: $(NAME)

$(NAME):
	bash ./script/check_folder.sh
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up -d --build

clean:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down

fclean: clean
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down -v --rmi all --remove-orphans
	
re: fclean all

wordpress:
	docker exec -ti wordpress bash


nginx:
	docker exec -ti nginx bash


mariadb:
	docker exec -ti mariadb bash

logs:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) logs 

.PHONY: all clean fclean re
