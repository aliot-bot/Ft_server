FROM debian:bookworm-slim

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        nginx \
        mariadb-server \
        php-fpm \
        php-mysql \
        php-mbstring \
        php-xml \
        wget \
        openssl \
        ca-certificates

RUN wget https://wordpress.org/latest.tar.gz -O /tmp/wordpress.tar.gz \
    && tar -xzf /tmp/wordpress.tar.gz -C /var/www/ \
    && rm /tmp/wordpress.tar.gz

RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.tar.gz \
        -O /tmp/phpmyadmin.tar.gz \
    && mkdir -p /var/www/phpmyadmin \
    && tar -xzf /tmp/phpmyadmin.tar.gz \
        --strip-components=1 \
        -C /var/www/phpmyadmin \
    && rm /tmp/phpmyadmin.tar.gz

COPY html/ /var/www/kanatello/
RUN chmod 755 /var/www/kanatello \
    && chmod 644 /var/www/kanatello/*

RUN mkdir -p /var/www/phpmyadmin/tmp \
    && chown -R www-data:www-data /var/www/wordpress \
    && chown -R www-data:www-data /var/www/phpmyadmin

RUN mkdir -p /etc/nginx/ssl \
    && openssl req -x509 -nodes -days 365 \
        -newkey rsa:2048 \
        -keyout /etc/nginx/ssl/server.key \
        -out /etc/nginx/ssl/server.crt \
        -subj "/CN=localhost"

COPY nginx/default /etc/nginx/sites-available/default
COPY nginx/routes /etc/nginx/sites-available/routes

COPY scripts/ /scripts/

RUN chmod +x /scripts/*.sh

CMD ["/scripts/start.sh"]