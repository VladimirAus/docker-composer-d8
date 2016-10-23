FROM php:apache
MAINTAINER vladimir@tomato-elephant-studio.com

RUN apt-get update && apt-get install -yq \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    libicu-dev \
    libxml2-dev \
    zip \
    unzip \
    tar \
    sendmail

RUN docker-php-ext-install -j$(nproc) json intl pdo pdo_mysql mbstring opcache \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd

# Change the second part of the sed to point to where you are going to have your volume with keys etc
# RUN sed -i 's@SSLCertificateFile	/etc/ssl/certs/ssl-cert-snakeoil.pem@SSLCertificateFile	/etc/apache2/ssl/STAR_drupal_org_au/STAR_drupal_org_au.pem@' /etc/apache2/sites-available/default-ssl.conf && \
#    sed -i 's@SSLCertificateKeyFile /etc/ssl/private/ssl-cert-snakeoil.key@SSLCertificateKeyFile /etc/apache2/ssl/STAR_drupal_org_au/STAR_drupal_org_au.key@' /etc/apache2/sites-available/default-ssl.conf && \
#    sed -i 's@#SSLCACertificateFile /etc/apache2/ssl.crt/ca-bundle.crt@SSLCACertificateFile /etc/apache2/ssl/STAR_drupal_org_au/STAR_drupal_org_au.crt@' /etc/apache2/sites-available/default-ssl.conf && \
#    sed -i 's@#SSLCertificateChainFile /etc/apache2/ssl.crt/server-ca.crt@SSLCertificateChainFile /etc/apache2/ssl/STAR_drupal_org_au/STAR_drupal_org_au_chained.crt@' /etc/apache2/sites-available/default-ssl.conf

# RUN letsencrypt --apache -d goldcoast2016.drupal.org.au -d www.goldcoast2016.drupal.org.au

# Apache modes
RUN a2enmod rewrite
# RUN a2enmod rewrite && \
#     a2enmod ssl && \
#     a2ensite default-ssl.conf

# Composer installation
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
    && php -r "if (hash_file('SHA384', 'composer-setup.php') === 'e115a8dc7871f15d853148a7fbac7da27d6c0030b848d9b3dc09e2a0388afed865e6a3d6b3c0fad45c48e2b5fc1196ae') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer

# Drupal console installation
# RUN curl https://drupalconsole.com/installer -L -o drupal.phar \
#     && php -r "readfile('https://drupalconsole.com/installer');" > drupal.phar \
#     && mv drupal.phar /usr/local/bin/drupal \
#     && chmod +x /usr/local/bin/drupal \
#     && drupal init --override --no-interaction \
#     && drupal check