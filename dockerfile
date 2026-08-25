ARG PHP_VERSION=8.4

FROM php:${PHP_VERSION}-apache

RUN apt-get update && apt-get install -y \
        git \
        unzip \
        zip \
        libzip-dev \
        default-mysql-client \
        msmtp \
        msmtp-mta \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libwebp-dev \
    && docker-php-ext-configure gd \
        --with-freetype \
        --with-jpeg \
        --with-webp \
    && docker-php-ext-install \
        gd \
        mysqli \
        pdo_mysql \
        zip \
    && a2enmod rewrite headers expires \
    && rm -rf /var/lib/apt/lists/*

COPY msmtprc /etc/msmtprc

WORKDIR /var/www/html