#!/bin/bash
main(){
    apt update
    
    # Instalar SSH y git 
    apt install ssh git -y
    systemctl enable ssh
    systemctl restart ssh

    #Instalar Apache2
    apt install apache2  -y
    systemctl enable apache2
    systemctl restart apache2

    #Instalar mysql
    apt install default-mysql-server -y
    systemctl enable mysql
    systemctl restart mysql

    #Instalar php
    apt install php libapache2-mod-php php-mysql -y
    systemctl restart apache2
}
if [ $(id -u) = 1000 ]; then
    echo "Root permissions needed!"
    echo "Exiting..."
    exit 1
fi
if [ $(id -u) = 0 ]; then
    main
fi

