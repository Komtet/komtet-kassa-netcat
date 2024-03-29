SHELL:=/bin/bash

help:
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[0;36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

build:  ## Собрать контейнер
	@docker-compose build

stop: ## Остановить все контейнеры
	@docker-compose down

start_web5: stop  ## Запустить контейнер
	@docker-compose up -d web5

start_web7: stop  ## Запустить контейнер
	@docker-compose up -d web7

.PHONY: help build stop start_web5 start_web7
.DEFAULT_GOAL := help
