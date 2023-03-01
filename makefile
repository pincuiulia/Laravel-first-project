SHL:=$(shell uname -s)
IS_MAC :=$(filter Darwin,$(SHL))
U_ID:=$(if $(IS_MAC),1000 ,$(shell id -u))
G_ID:=$(if $(IS_MAC),1000 ,$(shell id -g))

start: regenerate-env init-app setup

init-app:
	HOST_UID=${U_ID} HOST_GID=${G_ID} docker-compose -f docker-compose.dev.yml up -d --build

fix-ownership:
	docker exec laravel-php chmod -R 775 storage
	docker exec laravel-php chown -R laravel:laravel ./

setup:
	docker exec -u laravel:laravel laravel-php composer install

stop:
	HOST_UID=${U_ID} HOST_GID=${G_ID} docker-compose -f docker-compose.dev.yml stop

stop-v:
	HOST_UID=${U_ID} HOST_GID=${G_ID} docker-compose -f docker-compose.dev.yml down -v

laravel-bash:
	docker exec -u laravel:laravel -it laravel-php bash

regenerate-env:
	cd deploy && ./generate_env.sh local
