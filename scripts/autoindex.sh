#!/bin/sh

if grep -q "autoindex on;" /etc/nginx/sites-available/routes; then
    sed -i "s/autoindex on;/autoindex off;/" /etc/nginx/sites-available/routes
    echo "autoindex выключен"
else
    sed -i "s/autoindex off;/autoindex on;/" /etc/nginx/sites-available/routes
    echo "autoindex включен"
fi

nginx -s reload