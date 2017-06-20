#!/usr/bin/env bash

yes | sudo apt-get update

yes | sudo apt-get install php-xdebug

sudo service apache2 restart
