FROM ubuntu:22.04

RUN apt-get update -y \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        supervisor \
        apache2 libapache2-mod-php8.1 php8.1-xml php8.1-gd php8.1-curl php8.1-mbstring php8.1-fileinfo php8.1-mysqli php8.1-zip \
        php8.1-cli \
        mariadb-server \
        wget unzip ca-certificates openssl \
 && wget 'https://dle-news.com/files/dle_trial.zip' -O /var/www/dle_trial.zip \
 && unzip /var/www/dle_trial.zip -d /var/www/dle-dist \
 && rm -rf /var/www/html /var/www/dle_trial.zip \
 && mv -f /var/www/dle-dist/upload /var/www/html \
 && rm -rf /var/www/dle-dist \
 && apt-get remove -y wget unzip ca-certificates openssl \
 && apt-get autoremove -y \
 && apt-get clean \
 && bash -c 'chown -R www-data:www-data /var/www/html/{uploads,backup,engine/data,engine/data/emoticons,engine/cache,templates}'

RUN a2enmod rewrite

RUN echo "<Directory /var/www/html/>" > /etc/apache2/conf-enabled/dle.conf \
 && echo "Options Indexes FollowSymLinks" >> /etc/apache2/conf-enabled/dle.conf \
 && echo "AllowOverride All" >> /etc/apache2/conf-enabled/dle.conf \
 && echo "Require all granted" >> /etc/apache2/conf-enabled/dle.conf \
 && echo "</Directory>" >> /etc/apache2/conf-enabled/dle.conf

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive \
    MYSQL_DATABASE=dle_db \
    MYSQL_USER=dle_user \
    MYSQL_PASSWORD=dle_password

RUN mkdir -p /var/log/supervisor

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

EXPOSE 80 3306

# Copy startup script
COPY docker-entrypoint.sh /usr/local/bin/

# Set the startup script as the entry point
ENTRYPOINT ["docker-entrypoint.sh"]
