FROM php:8.2-apache
COPY --from=composer /usr/bin/composer /usr/bin/composer
RUN apt-get update && apt-get -y install libzip-dev libicu-dev
RUN docker-php-ext-install mysqli zip intl
RUN pecl install xdebug-3.2.0
RUN docker-php-ext-enable xdebug
COPY php.ini /usr/local/etc/php/php.ini
RUN a2enmod rewrite
