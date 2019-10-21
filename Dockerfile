FROM ubuntu:18.04
LABEL maintainer="LiveXP <dev@livexp.fr>"

ENV DEBIAN_FRONTEND="noninteractive"

ENV COMPOSER_HOME="/tmp" \
    COMPOSER_ALLOW_SUPERUSER=1 \
    LDAPTLS_REQCERT="never"

RUN apt update -q && apt install --no-install-recommends -qy \
    curl \
    php7.2 \
    php7.2-curl \
    php7.2-ldap \
    php7.2-apcu \
    php7.2-gd \
    php7.2-gmp \
    php7.2-intl \
    php7.2-yaml \
    php7.2-xdebug \
    php7.2-common \
    php7.2-json \
    php7.2-mbstring \
    php7.2-phar \
    php7.2-xml \
    php7.2-zip

RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime && echo "Europe/Paris" > /etc/timezone

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN apt install -y nodejs npm
RUN npm install -g yarn

