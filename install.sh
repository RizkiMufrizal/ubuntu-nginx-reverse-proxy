#! /bin/sh
#
# install.sh
# Copyright (C) 2016 Rizki Mufrizal <mufrizalrizki@gmail.com>
#
# Distributed under terms of the MIT license.
#

echo "mulai Provisioning"

echo "setup software source dan repository"
cp /vagrant/config/sources.list /etc/apt/sources.list
cp /vagrant/config/environment /etc/environment

add-apt-repository -y ppa:git-core/ppa
add-apt-repository -y ppa:nginx/stable

echo "memulai update"
apt-get update

echo "mulai upgrade"
apt-get upgrade -y

echo "mulai dist upgrade"
apt-get dist-upgrade -y

echo "instalasi build essential"
apt-get install -y build-essential libssl-dev

echo "instalasi git"
apt-get install -y git

echo "instalasi nginx"
apt-get install -y nginx

echo "Konfigurasi reverse proxy nginx"
cp /vagrant/config/nginx-proxy /etc/nginx/sites-available/example
ln -s /etc/nginx/sites-available/example /etc/nginx/sites-enabled/example
rm /etc/nginx/sites-enabled/default
service nginx restart

echo "instalasi node js"
curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
apt-get install -y nodejs

echo "instalasi coffeescript"
npm install -g coffee-script

echo "instalasi nodemon"
npm install -g nodemon

echo "buat folder untuk project node js"
mkdir Belajar-Reverse-Proxy

echo "ke folder Belajar-Reverse-Proxy"
cd Belajar-Reverse-Proxy

echo "copy app.js ke folder Belajar-Reverse-Proxy"
cp /vagrant/config/app.js /home/vagrant/Belajar-Reverse-Proxy/app.js

echo "jalankan server"
nodemon app.js
