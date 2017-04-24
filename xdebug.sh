#!/usr/bin/env bash

# Disable obsolete PPA
echo "============================================"
echo "Disabling obsolete PPA and reverting to official packages."
echo "============================================"
sudo apt-get install ppa-purge
yes | sudo ppa-purge ppa:ondrej/php5-5.6
# Update to current PPA
echo "============================================"
echo "Adding current PPA and updating packages."
echo "============================================"
yes | sudo add-apt-repository ppa:ondrej/php
yes | sudo apt-get update
yes | sudo apt-get upgrade
sudo apt-get autoremove
# Install Xdebug
echo "============================================"
echo "Installing Xdebug."
echo "============================================"
yes | sudo apt-get install php5-xdebug
echo "; xdebug
zend_extension=xdebug.so
xdebug.remote_enable=1
xdebug.remote_connect_back=1
xdebug.remote_port=9000
xdebug.remote_host=192.168.33.10" >> /etc/php5/apache2/conf.d/20-xdebug.ini
# add composer to path
echo "============================================"
echo "Adding composer to PATH."
echo "============================================"
export PATH="~/.composer/vendor/bin:$PATH"
# restart Apache
echo "============================================"
echo "Restarting Apache."
sudo service apache2 restart
echo "============================================"
echo "============================================"
echo "Site setup complete."
echo "============================================"
