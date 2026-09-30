#!/bin/sh

echo "Остановка ВЕБ-сервиса"
docker stop ft_server

echo "Удаление контейнера"
docker rm ft_server

echo "Удаление образа"
docker rmi deb-buster