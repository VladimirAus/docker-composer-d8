FROM php:apache
MAINTAINER vladimir@tomato-elephant-studio.com

RUN apt-get update && apt-get install -yq \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    libicu-dev \
    libxml2-dev

RUN docker-php-ext-install -j$(nproc) json intl pdo pdo_mysql mbstring opcache \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

# Change the second part of the sed to point to where you are going to have your volume with keys etc
RUN sed -i 's@SSLCertificateFile	/etc/ssl/certs/ssl-cert-snakeoil.pem@SSLCertificateFile	/etc/apache2/ssl/STAR_drupal_org_au/STAR_drupal_org_au.pem@' /etc/apache2/sites-available/default-ssl.conf && \
    sed -i 's@SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key@SSLCertificateKeyFile /etc/apache2/ssl/STAR_drupal_org_au/STAR_drupal_org_au.key@' /etc/apache2/sites-available/default-ssl.conf && \
    sed -i 's@#SSLCACertificateFile /etc/apache2/ssl.crt/ca-bundle.crt@SSLCACertificateFile /etc/apache2/ssl/STAR_drupal_org_au/STAR_drupal_org_au.crt@' /etc/apache2/sites-available/default-ssl.conf && \
    sed -i 's@#SSLCertificateChainFile /etc/apache2/ssl.crt/server-ca.crt@SSLCertificateChainFile /etc/apache2/ssl/STAR_drupal_org_au/STAR_drupal_org_au_chained.crt@' /etc/apache2/sites-available/default-ssl.conf

# RUN letsencrypt --apache -d goldcoast2016.drupal.org.au -d www.goldcoast2016.drupal.org.au

RUN a2enmod rewrite && \
    a2enmod ssl && \
    a2ensite default-ssl.conf

