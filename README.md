# Docker - Drupal 8 setup with Composer

## Installation

* Clone the repo
* Install [Docker](https://docs.docker.com/engine/installation/) and [Docker Compose](https://docs.docker.com/compose/install/)
* Run `docker-compose kill && docker-compose up -d --build`

## Running php

```
docker-compose run php7 bash
```

Use `exit` to exit the container

## Installing Drupal Console & Drupal 8 locally

```
cd /var/www/html

composer create-project \
drupal-composer/drupal-project:8.x-dev \
drupal8.dev \
--prefer-dist \
--no-progress \
--no-interaction

```

Drupal now should be accessible via [this link](http://localhost:8080/drupal8.dev)