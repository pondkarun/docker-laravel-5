# โหลด Base Image PHP 5.6.39-fpm
FROM php:5.6.39-fpm

# ติดตั้ง Extension bcmath  และ pdo_mysql สำหรับ Laravel 7, 8, 9 และ 10
RUN docker-php-ext-install bcmath pdo_mysql

# สั่ง update image และ ติดตั้ง git zip และ unzip pacakage
RUN apt-get update
RUN apt-get install -y git zip unzip

# ติดตั้ง NodeJS
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - 
RUN apt-get install -y nodejs

# Copy file composer:latest ไว้ที่ /usr/bin/composer
COPY --from=composer:2.2 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

EXPOSE 9000