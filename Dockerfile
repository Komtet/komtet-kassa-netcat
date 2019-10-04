FROM php:5.6.38-apache as php5
ENV TZ Europe/Moscow

RUN docker-php-ext-install mysqli

RUN apt-get update
RUN apt-get install -y \
    libwebp-dev \
    libjpeg62-turbo-dev \
    libpng-dev libxpm-dev \
    libfreetype6-dev \
    libgmp-dev \
    libpng-dev 

RUN docker-php-ext-configure gd \
    --with-gd \
    --with-webp-dir \
    --with-jpeg-dir \
    --with-png-dir \
    --with-zlib-dir \
    --with-xpm-dir \
    --with-freetype-dir \
    --enable-gd-native-ttf

RUN docker-php-ext-install gd
RUN ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h && docker-php-ext-install gmp

WORKDIR /var/www/html
COPY php .


FROM php:7.2-apache as php7
ENV TZ Europe/Moscow

RUN docker-php-ext-install mysqli

RUN apt-get update
RUN apt-get install -y \
    libwebp-dev \
    libjpeg62-turbo-dev \
    libpng-dev libxpm-dev \
    libfreetype6-dev \
    libgmp-dev \
    libpng-dev 

RUN docker-php-ext-configure gd \
    --with-gd \
    --with-webp-dir \
    --with-jpeg-dir \
    --with-png-dir \
    --with-zlib-dir \
    --with-xpm-dir \
    --with-freetype-dir \
    --enable-gd-native-ttf

RUN docker-php-ext-install gd
RUN ln -s /usr/include/x86_64-linux-gnu/gmp.h /usr/include/gmp.h && docker-php-ext-install gmp


WORKDIR /var/www/html
COPY php .
