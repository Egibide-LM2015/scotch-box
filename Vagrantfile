# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    # /*=====================================
    # =            FREE VERSION!            =
    # =====================================*/
    # This is the free (still awesome) version of Scotch Box.
    # Please go Pro to support the project and get more features.
    # Check out https://box.scotch.io to learn more. Thanks

    config.vm.box = "scotch/box"
    config.vm.network "private_network", ip: "192.168.33.10"
    config.vm.hostname = "scotchbox"
    config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]

    config.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.gui = false
      v.cpus = 1
    end

    config.vm.provision "shell", path: "config/apache.sh"

    config.vm.provision "shell", inline: <<-SHELL
      sed -i 's/bind-address/#bind-address/g' /etc/mysql/my.cnf
      mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root';"      
      service mysql restart
    SHELL

    # Descomentar la siguiente línea para activar la tarjeta de red con IP "pública"
    #config.vm.network "public_network", ip: "172.20.224.123", netmask: "255.255.0.0"

end
