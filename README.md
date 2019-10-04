# komtet_kassa_netcat

## Запуск проекта

* Скачать установщик Netcat E-commerce - https://netcat.ru/democentre/

* Добавить в /etc/hosts  127.0.0.1	netcat.localhost.com
* Создать ссылку на nginx.cfg в sites-enabled nginx
```sh
cd /etc/nginx/sites-enabled
sudo ln -s [путь_до_проекта]/komtet-kassa-netcat/nginx.cfg netcat.cfg
sudo nginx -t
sudo nginx -s reload
```
* Cоздать в корневом каталоге папку php
* Распаковать архив Netcat E-commerce в папку: *php*
* В файл /php/.htaccess добавить строчку: *php_value date.timezone 'Europe/Moscow'*
* Установить права на папку php
```sh
sudo chmod -R 777 php
```

* Запустить сборку проекта
```sh
make build
```

## Установка Netcat E-commerce
* Запустить контейнер
```sh
make start_web7
```
* Проект будет доступен по адресу: http://netcat.localhost.com;
* Настройки подключения к бд MySQL:
```sh
Сервер: db
Пользователь: devuser
Пароль: devpass
БД: test_db
```
* Указать email и пароль для входа в Админку
* Удалить папку *'install'* из папки *'php'*
```sh
rm -rf  [путь_до_проекта]/komtet-kassa-netcat/php/install
```
## Доступные комманды из Makefile

* Собрать проект
```sh
make build
```
* Запустить проект на php5.6
```sh
make start_web5
```

* Запустить проект на php7.2
```sh
make start_web7
```

* Остановить проект
```sh
make stop
```
