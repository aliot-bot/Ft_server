#!/bin/sh

service mariadb start

mariadb <<EOF
create database wordpress;

create user 'wordpress'@'localhost' identified by 'wordpress';

grant all privileges on wordpress.* to 'wordpress'@'localhost';

flush privileges;
EOF