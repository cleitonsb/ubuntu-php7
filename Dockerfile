FROM ubuntu:18.04

MAINTAINER cleitonsb

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -yq --no-install-recommends \
    apt-utils curl apache2 libapache2-mod-php7.2 \
    php7.2-cli \
    php7.2-json \
    php7.2-curl \
    php7.2-fpm \
    php7.2-gd \
    php7.2-ldap \
    php7.2-mbstring \
    php7.2-mysql \
    php7.2-soap \
    php7.2-sqlite3 \
    php7.2-xml \
    php7.2-zip \
    php7.2-intl \
    php-imagick \
    composer \
    openssl \
    vim \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN echo "ServerName localhost" | tee /etc/apache2/conf-available/servername.conf
RUN a2enconf servername

EXPOSE 80 443

WORKDIR /var/www/html

CMD apachectl -D FOREGROUND
