# Apache2 with Postfix on Debian8
Apache2 over Debian 8 with PHP 5.4.44 and Mod-security

[![Docker Pulls](https://img.shields.io/docker/pulls/miguelwill/php54-apache24.svg?style=plastic)](https://hub.docker.com/r/miguelwill/php54-apache24/)

# Description
debian8 image with apache2, PHP 5.4.44 and Postfix (based on php:5.4.44-apache image)
ready to work with old, unupdated sites, such as joomla 2.5 for example

ready to work with http (TCP/80) and https (TCP/443) connections
the certificate can be loaded into an external load balancer (such as nginx) so that you do not need to replace the default certificate used in apache2

# Configuration
you only need to configure the database access data, and the files must be copied to the path of the loaded volume in /var/www/html
you have mysql-client to import a mysql database backup into the "db" server from the container console

these parameters are also defined in docker-compose.yml file

# Add Stack with config
  * download files from https://github.com/miguelwill/php54-apache24
  * edit docker-compose-db.yml file editing db autentication parameters
  * run for deploy stack : docker stack deploy -c docker-compose.yml debian7-apache2
  * waith for db initialization

#Add with docker-compose and files
  * with docker-compose simply run "docker-compose up" on folder
  * with file "docker-compose-db.yml": docker-compose -f docker-compose-db.yml up



# Volume

  * '/var/www/html' - "load php and html files for your old website"


# Variables

  * 'TZ' - "time zone"
  * 'RELAY_HOST' - "relayhost for postfix, default is empty"
  * 'PHP_MEMORY_LIMIT' - memory_limit variable on php.ini
  * 'PHP_UPLOAD_MAX_FILESIZE' - upload_max_filesize variable on php.ini
  * 'PHP_POST_MAX_SIZE' - post_max_size on php.ini
