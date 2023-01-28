#!/bin/bash
docker cp fixtures.json infra-web-1:/app/   # копируем фикстуры
docker-compose exec web python manage.py loaddata fixtures.json
docker-compose exec web rm fixtures.json    # удаляем фикстуры
