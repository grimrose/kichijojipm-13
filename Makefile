.DEFAULT := help

.PHONY: help
help:
	cat Makefile

.PHONY: install
install:
	pipenv install

.PHONY: activate
activate:
	pipenv shell

.PHONY: rise
rise:
	jupyter nbextension install rise --py --sys-prefix
	jupyter nbextension enable rise --py --sys-prefix

.PHONY: start
start:
	jupyter-notebook

.PHONY: plantuml-build
plantuml-build:
	docker-compose -f docker/docker-compose.plantuml.yml build

.PHONY: svg
svg: plantuml-build
	cat docs/ER.puml | docker-compose -f docker/docker-compose.plantuml.yml run --rm plantuml -p -tsvg > img/ER.svg
