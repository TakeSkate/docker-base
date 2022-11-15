-include .env
container=${APP_SLUG}_php-fpm
container_mysql=${APP_SLUG}_mysql
MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
LOGDATE=$(shell date --iso=seconds)

up:
	docker-compose up -d

up-prod:
	docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d

start: up

stop:
	docker-compose stop

down: stop
restart: stop up

rebuild: clean
	docker-compose build --force-rm --no-cache
	docker-compose up -d

build: clean
	docker-compose build
	docker-compose up -d

clean:
	docker-compose rm -vsf
	docker-compose down -v --remove-orphans

jumpin:
	docker exec -it ${container} bash

composer-install:
	docker exec ${container} composer install --ignore-platform-reqs --prefer-dist

migrate:
	docker exec ${container} php artisan migrate -n

migrate-fresh:
	docker exec ${container} php artisan migrate:fresh -n

seed:
	docker exec ${container} php artisan db:seed -n

app-init:
	docker exec ${container} cp .env.example .env
	docker exec ${container} php artisan storage:link -n
	docker exec ${container} php artisan key:generate -n

dev: up composer-install app-init migrate-fresh

run:
	cd .\application &	npm i
	cd .\application &	npm run dev

conf:
	docker exec ${container} php artisan cache:clear
	docker exec ${container} php artisan route:clear
	docker exec ${container} php artisan config:clear
	docker exec ${container} composer dump-autoload

permission:
	docker exec ${container} chgrp -R www-data storage bootstrap/cache
	docker exec ${container} chmod -R ug+rwx storage bootstrap/cache

# Run tests on laravel:
# All tests: APP_ENV=testing php artisan test
# Feature tests: APP_ENV=testing php artisan test --testsuite=Feature
# All tests with Coverage: APP_ENV=testing php artisan test --coverage

mysql-dump-linux:
	docker exec ${container_mysql} /bin/bash -c 'mysqldump --all-databases -uroot -p${MYSQL_ROOT_PASSWORD}' > /backups/mysql/all-databases${LOGDATE}.sql

