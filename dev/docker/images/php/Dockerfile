FROM php:7.4-fpm
RUN apt update && apt -y install \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libxml2-dev \
    libxslt-dev \
    libzip-dev \
    libmcrypt-dev \
    libwebp-dev \
    libicu-dev \
    wget \
    openssl \
    git \
    openssh-client \
    build-essential \
    autoconf \
    automake \
    nasm \
    bc \
    unzip \
    dnsutils
    
# get php extension
RUN docker-php-ext-install -j$(nproc) \
    gd \
    soap \
    bcmath \
    intl \
    pdo_mysql \
    simplexml \
    xsl \
    zip
    
# get composer 
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer 
#RUN php -d memory_limit=-1 composer.phar require hwi/oauth-bundle php-http/guzzle6-adapter #php-http/httplug-bundle
RUN echo 'memory_limit=-1' > /usr/local/etc/php/php-cli.ini

# Set magento file permissions
RUN useradd -m -s /bin/bash magento \
    && usermod -a -G www-data magento
    
RUN mkdir project-community-edition

ADD auth.json /var/www/html/

ADD composer.json /var/www/html
    
RUN composer create-project --repository-url=https://repo.magento.com/magento/project-community-edition

EXPOSE "9000"
