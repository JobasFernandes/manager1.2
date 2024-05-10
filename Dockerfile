# Imagem Base
FROM php:8.1.28-apache

# Definindo o fuso horário
ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Habilitando o mod_rewrite do Apache
RUN a2enmod rewrite

# Instalar extensões necessárias, incluindo pdo_mysql
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libonig-dev \
        libxml2-dev \
        libzip-dev \
        default-mysql-client \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd mysqli pdo pdo_mysql mbstring exif pcntl bcmath zip

# Copiar arquivos necessários do manager
WORKDIR /var/www/html/
COPY . .

# Definindo permissões de diretório
RUN chown -R www-data:www-data /var/www/html

# Iniciando cron e Apache
CMD ["apache2-foreground"]
