DOCKER_IMAGES_TAG?=latest
DOCKER_REGISTRY_URL?=mk51/devops-app

test-web:
	bash -c "for i in {1..9}; do sleep 1; curl -k https://localhost && exit 0; done; exit 1"

push-release:
	docker tag ${DOCKER_REGISTRY_URL}:cashed ${DOCKER_REGISTRY_URL}:${DOCKER_IMAGES_TAG}

push-prod:
	docker push ${DOCKER_REGISTRY_URL}:${DOCKER_IMAGES_TAG} 

prod: build up test-web push-prod

server:
	npx nodos server

test:
	npm -s test

up:
	docker-compose up -d

ps:
	docker-compose ps 

build:
	docker-compose build

logs:
	docker-compose logs -f

down:
	docker-compose down || true

stop:
	docker-compose stop || true

restart:
	docker-compose restart

setup: compose-down compose-build

server:
	npx nodos server -h 0.0.0.0

test:
	npm -s test

install:
	npm i

compose:
	docker-compose up

compose-setup: compose-build compose-install

compose-install:
	docker-compose run app make install

compose-build:
	docker-compose build

compose-bash:
	docker-compose run app bash
