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
