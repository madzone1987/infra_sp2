# Клонируем репозиторий.
git clone git@github.com:madzone1987/infra_sp2.git

# Копируем файл .env.
cp secret_information infra_sp2/infra/.env

# Переходим в директорию infra.
cd infra_sp2/infra

# Запускаем docker-compose в фоновом режиме.
docker-compose up -d

# Выполняем миграции.
docker-compose exec web python manage.py migrate

# Копируем статику.
docker-compose exec web python manage.py collectstatic --no-input

# Заполняем базу.
./restore.sh
