.SILENT:
SIGWIN_INFRA_ROOT := vendor/sigwin/infra/resources
include vendor/sigwin/infra/resources/Common/default.mk

vendor/sigwin/infra/resources/Common/default.mk:
	docker run --rm --user '$(shell id -u):$(shell id -g)' --volume '$(shell pwd):/app' --workdir /app composer:2 require sigwin/infra
	rm -f composer.*

start: ## Start workstation services
	docker network inspect public >/dev/null 2>&1 || docker network create public
	docker compose $(if $(OS_FAMILY),--profile $(OS_FAMILY)) up --detach --remove-orphans
