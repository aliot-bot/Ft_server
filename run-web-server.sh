#!/bin/bash

echo "Сборка ВЕБ-сервиса"
docker build -t deb-buster .

echo "Запуск ВЕБ-сервиса"
docker run -d --name ft_server -p 8080:80 -p 443:443 deb-buster

sleep 2

echo "Победи БОССА"

open http://localhost:8080