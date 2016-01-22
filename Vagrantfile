# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "scotch/box"
    config.vm.network "private_network", ip: "192.168.33.10"
    config.vm.hostname = "scotchbox"
    config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]

    # Optional NFS. Make sure to remove other synced_folder line too
    #config.vm.synced_folder ".", "/var/www", :nfs => { :mount_options => ["dmode=777","fmode=666"] }

    config.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.gui = false
      v.cpus = 1
    end

    config.vm.provision "shell", inline: <<-SHELL
      apt-get update
      apt-get install -y php5-xdebug
      cat /var/www/config/php.ini >> /etc/php5/apache2/php.ini
      service apache2 restart
    SHELL

    # Descomentar la siguiente línea para activar la tarjeta de red con IP "pública"
    #config.vm.network "public_network", ip: "172.20.224.123", netmask: "255.255.0.0"

end
