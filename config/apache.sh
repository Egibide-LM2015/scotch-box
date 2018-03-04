#!/usr/bin/env bash

yes | sudo apt-get update
yes | sudo apt-get install php-xdebug

sudo cp /var/www/config/php.ini /etc/php/7.0/apache2/conf.d/20-xdebug.ini

sudo cp -f /var/www/config/dir.conf /etc/apache2/mods-available/dir.conf

sudo service apache2 restart
