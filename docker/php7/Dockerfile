FROM php:apache
MAINTAINER vladimir@tomato-elephant-studio.com

RUN apt-get update && apt-get install -yq \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    libicu-dev

RUN docker-php-ext-install gd json intl pdo pdo_mysql mbstring opcache

# Change the second part of the sed to point to where you are going to have your volume with keys etc
RUN sed -i 's@SSLCertificateFile	/etc/ssl/certs/ssl-cert-snakeoil.pem@SSLCertificateFile	/etc/apache2/ssl/STAR_drupal_org_au/STAR_drupal_org_au.pem@' /etc/apache2/sites-available/default-ssl.conf && \
    sed -i 's@SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key@SSLCertificateKeyFile /etc/apache2/ssl/STAR_drupal_org_au/STAR_drupal_org_au.key@' /etc/apache2/sites-available/default-ssl.conf && \
    sed -i 's@#SSLCACertificateFile /etc/apache2/ssl.crt/ca-bundle.crt@SSLCACertificateFile /etc/apache2/ssl/STAR_drupal_org_au/STAR_drupal_org_au.crt@' /etc/apache2/sites-available/default-ssl.conf

RUN a2enmod rewrite && \
    a2enmod ssl && \
    a2ensite default-ssl.conf

