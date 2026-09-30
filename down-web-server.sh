#!/bin/sh

echo "Остановка ВЕБ-сервиса"
docker stop ft_server

echo "Удаление ВЕБ-сервиса"
docker rm ft_server