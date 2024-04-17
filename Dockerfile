FROM php:fpm-alpine3.18

RUN docker-php-ext-install pdo pdo_mysql
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app
COPY . .

#RUN chown -R www-data:www-data /app
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN composer install 

CMD php artisan serve --host=0.0.0.0