#!/bin/sh

cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

sed -i "s/database_name_here/wordpress/" /var/www/wordpress/wp-config.php
sed -i "s/username_here/wordpress/" /var/www/wordpress/wp-config.php
sed -i "s/password_here/wordpress/" /var/www/wordpress/wp-config.php