#!/usr/bin/env bash

sudo rm /etc/apt/sources.list.d/ondrej-php5-5_6-trusty.list
sudo add-apt-repository --yes ppa:ondrej/php >/dev/null 2>&1

yes | sudo apt-get update

yes | sudo apt-get install php-xdebug

sudo cp /var/www/config/php.ini /etc/php/7.0/apache2/conf.d/20-xdebug.ini

sudo service apache2 restart
