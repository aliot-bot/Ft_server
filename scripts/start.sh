#!/bin/sh

/scripts/database.sh
/scripts/wordpress.sh

service php8.2-fpm start

nginx -g "daemon off;"