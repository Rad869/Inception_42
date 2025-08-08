# Makefile for Docker Compose project

# Variables
NAME = inception
DOCKER_COMPOSE = docker compose
COMPOSE_FILE = ./srcs/docker-compose.yml

# Default target
all: $(NAME)

$(NAME):
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) up --build

clean:
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down

fclean: clean
	$(DOCKER_COMPOSE) -f $(COMPOSE_FILE) down -v --rmi all --remove-orphans
	
re: fclean all

.PHONY: all clean fclean re
