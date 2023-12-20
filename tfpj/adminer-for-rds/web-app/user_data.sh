#! /bin/bash
sudo apt-get update && sudo apt-get upgrade

sudo apt-get install -y apache2
sudo systemctl start apache2
sudo systemctl enable apache2

sudo apt-get install -y php libapache2-mod-php

sudo apt-get install -y adminer
sudo a2enconf adminer
sudo systemctl reload apache2
