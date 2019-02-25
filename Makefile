SERVICE ?=
COMPOSE_FILE_ARGS ?= -f docker-compose.yml
DOCKER_COMPOSE = docker-compose $(COMPOSE_FILE_ARGS)

build:
	$(DOCKER_COMPOSE) build

push: build
	$(DOCKER_COMPOSE) push

.PHONY: %
.DEFAULT: run
