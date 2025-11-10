GREEN := \033[0;32m
RED := \033[0:31m
YELLOW := \033[1;33m
RESET := \033[0m

all: up

up:
	@printf "$(GREEN)STARTING...$(RESET)\n"
	@sleep 1
	docker compose up -d

down:
	@printf "$(GREEN)ENDING...$(RESET)\n"
	@sleep 1
	docker compose down

clean: down
	@if [ -n "$$(docker ps -q)" ]; then \
		@printf "$(RED)REMOVING CONTAINERS...$(RESET)\n"; \
		@sleep 1; \
		docker rm -f $$(docker ps -q); \
	fi
	@printf "$(RED)REMOVING IMAGES...$(RESET)\n"
	@sleep 1
	@if [ -n "$$(docker images -q)" ]; then \
		docker rmi -f $$(docker images -q) \
	fi

fclean: clean
	@printf "$(REMOVING)REMOVING VOLUMES...$(RESET)\n"
	@sleep 1
	docker system prune --volumes

re: down clean up
