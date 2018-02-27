# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    
    # This is Scotch Box 3.0 (the free version)
    # _________________________________________
    # If you want PHP7, MySQL 5.7, Ubuntu 16.04, Build Scripts (customize your own boxes in minutes)...
    # ... an NGINX version, PHPUnit, Yarn, WebPack, improved email testing with MailHog...
    # ... generally Higher versions of things, Ruby (via RVM), Node (via NVM), WebPack ready, and more.
    
    # Just go to https://box.scotch.io/pro
    # Your support will help keep this project alive!

    config.vm.box = "scotch/box"
    config.vm.network "private_network", ip: "192.168.33.10"
    config.vm.hostname = "scotchbox"
    config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]

    config.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.gui = false
      v.cpus = 1
    end

    config.vm.provision "shell", path: "config/xdebug.sh"

    config.vm.provision "shell", inline: <<-SHELL
      sed -i 's/bind-address/#bind-address/g' /etc/mysql/my.cnf
      mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root';"      
      service mysql restart
    SHELL

    # Descomentar la siguiente línea para activar la tarjeta de red con IP "pública"
    #config.vm.network "public_network", ip: "172.20.224.123", netmask: "255.255.0.0"

end
