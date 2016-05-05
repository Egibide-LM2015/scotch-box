# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

    config.vm.box = "scotch/box"
    config.vm.box_url = ["http://nunki.diocesanas.org/mv/vagrant/scotch.box",
                         "https://atlas.hashicorp.com/scotch/boxes/box/versions/2.5/providers/virtualbox.box"]
    config.vm.network "private_network", ip: "192.168.33.10"
    config.vm.hostname = "scotchbox"
    config.vm.synced_folder ".", "/var/www", :mount_options => ["dmode=777", "fmode=666"]

    config.vm.provider "virtualbox" do |v|
      v.memory = 1024
      v.gui = false
      v.cpus = 1
    end

    config.vm.provision "shell", inline: <<-SHELL
      
      if ping -c 1 nunki.diocesanas.org &> /dev/null
      then
        echo 'Acquire::http::Proxy "http://proxyaulas.diocesanas.org:8080/";' > /etc/apt/apt.conf.d/01proxy
        echo 'Acquire::https::Proxy "http://proxyaulas.diocesanas.org:8080/";' >> /etc/apt/apt.conf.d/01proxy
      fi

      apt-get update
      apt-get install -y php5-xdebug
      cat /var/www/config/php.ini >> /etc/php5/apache2/php.ini
      service apache2 restart
      sed -i 's/bind-address/#bind-address/g' /etc/mysql/my.cnf
      mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root';"      
      service mysql restart
    SHELL

    # Descomentar la siguiente línea para activar la tarjeta de red con IP "pública"
    #config.vm.network "public_network", ip: "172.20.224.123", netmask: "255.255.0.0"

end
