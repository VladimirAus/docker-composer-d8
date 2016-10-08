alias cdwww="cd /var/www"
alias dcps="docker-compose ps"
alias dcreset="docker-compose kill && docker-compose rm && docker-compose up -d --build"

# Drupal project specific
ROOT='--root="/var/www/html"'

DRUSH="docker-compose run drush"
alias dcdrush="$DRUSH $ROOT"

alias drushsi="$DRUSH site-install conference --db-url=mysql://sql_docker_d8_tes:Abra16#Cadabra@127.0.0.1:3306/do_docker_d8_tes $ROOT -y"
alias drushcr="$DRUSH cr all $ROOT"
alias drushuli="$DRUSH uli --uri='http://planning-portal.vm.dev' $ROOT"
alias drushbuild="drushsi && drushuli && drushcr"

