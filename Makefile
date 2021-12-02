COMPONENT := laravel_docker
CODE_CONTAINER := php
APP_ROOT := /var/www/laravel-docker-codebase

all: up logs

.PHONY: build
build:
	@userId=$$(id -u) groupId=$$(id -g) docker-compose -p ${COMPONENT} -f ops/docker/docker-compose.yml build

build-nocache:
	@userId=$$(id -u) groupId=$$(id -g) docker-compose -p ${COMPONENT} -f ops/docker/docker-compose.yml build --no-cache

up:
	@userId=$$(id -u) groupId=$$(id -g) docker-compose -p ${COMPONENT} -f ops/docker/docker-compose.yml up -d
	@sleep 2
restart:
	@userId=$$(id -u) groupId=$$(id -g) docker-compose -p ${COMPONENT} -f ops/docker/docker-compose.yml restart $(s)

enter:
	@./ops/scripts/enter.sh ${COMPONENT} $(s)

kill:
	@userId=$$(id -u) groupId=$$(id -g) docker-compose -p ${COMPONENT} -f ops/docker/docker-compose.yml kill

stop:
	@userId=$$(id -u) groupId=$$(id -g) docker-compose -p ${COMPONENT} -f ops/docker/docker-compose.yml stop $(s)

down:
	@userId=$$(id -u) groupId=$$(id -g) docker-compose -p ${COMPONENT} -f ops/docker/docker-compose.yml kill
	@userId=$$(id -u) groupId=$$(id -g) docker-compose -p ${COMPONENT} -f ops/docker/docker-compose.yml rm -f
	@userId=$$(id -u) groupId=$$(id -g) docker-compose -p ${COMPONENT} -f ops/docker/docker-compose.yml down --remove-orphans

logs:
	@userId=$$(id -u) groupId=$$(id -g) docker-compose -p ${COMPONENT} -f ops/docker/docker-compose.yml logs -f $(s)
ps:
	@userId=$$(id -u) groupId=$$(id -g) docker-compose -p ${COMPONENT} -f ops/docker/docker-compose.yml ps
