FROM php:7.4-alpine

RUN apk --no-cache update && \
    apk --no-cache upgrade && \
    apk --no-cache add --virtual .build-deps $PHPIZE_DEPS && \
    apk --no-cache add libexif-dev libjpeg-turbo-dev libpng-dev libheif-dev && \
    apk --no-cache add vips-dev vips-tools && \
    pecl install vips && \
    echo 'extension=vips.so' > /usr/local/etc/php/conf.d/php-ext-vips.ini

COPY --from=composer:2.0 /usr/bin/composer /usr/bin/composer

COPY ./php.ini $PHP_INI_DIR/conf.d/zz-php.ini

CMD ["php", "-S", "0.0.0.0:8888"]
