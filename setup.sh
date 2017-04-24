#!/bin/sh

# Default
apt-get update
apt-get install sudo \
  vim-nox \
  ntp \
  ntpdate \
  bash-completion \
  make \
  wget \
  build-essential -y

# Mysql
echo "mysql-server mysql-server/root_password password root" | debconf-set-selections
echo "mysql-server mysql-server/root_password_again password root" | debconf-set-selections
apt-get install mysql-server -y

# PHP
apt-get install php5-dev \
  php5-curl \
  libpcre3-dev \
  gcc \
  php5-mysql \
  php5-fpm \
  php5-cli \
  php5-curl \
  php5-gd \
  php5-intl \
  php-pear \
  php5-imagick \
  php5-imap \
  php5-mcrypt \
  php5-memcache \
  php5-pspell \
  php5-recode \
  php5-snmp \
  php5-sqlite \
  php5-tidy \
  php5-xmlrpc \
  php5-xsl -y 

# Nginx
cd /tmp
wget "http://nginx.org/keys/nginx_signing.key"
apt-key add nginx_signing.key
touch /etc/apt/sources.list.d/nginx.list
echo "deb http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list.d/nginx.list
echo "deb-src http://nginx.org/packages/debian/ jessie nginx" >> /etc/apt/sources.list.d/nginx.list
apt-get update
apt-get install nginx -y

mkdir -p /var/www
chown -R www-data:www-data /var/www

# Supervisor mescouilles
apt-get install supervisor -y

mkdir -p /var/log/supervisord/
touch /var/log/supervisord/supervisord.log

service mysql stop
service nginx stop
service php5-fpm stop

