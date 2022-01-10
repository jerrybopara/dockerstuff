## PHP 7.4 + Apache2 + Dynamic ENV

@Jerry Bopara :+1: Hey !! Docker Compose :) :shipit:

<!--lint disable awesome-toc-->
### Getting started

- Just rename the **sample_.env** to **.env** and update the variables as per your need.

- docker-compose.yml 
   - Includes Service: Apache-php, Exposed Port 80,443 & Custom Network.
   - .env environment Variable's
```
# Container Name
ContainerName=WebHost01

# Location of Web Directory 
WebDir=public_html

# Choose PHP Verison - php74 OR php56
PHP=php74

# HTTP & HTTPS HOST PORTS
HOST_HTTP_PORT=1180
HOST_HTTPS_PORT=11443

# Apache Vhost Configuration
APACHE_CONF=000-default.conf

# SSL Volume
SSL_VOLUME=SSL_CERTS

# Apache Log Directory 
APACHE_LOG_VOLUME=logs

# Name the Local Network 
Local_Network=My_Local_Network
```

- php Configuration file - ./docker/php.ini 
- DockerFile's 
   - ./docker/Dockerfile-php56
   - ./docker/Dockerfile-php74

## Container Services & DockerFile 
 1. PHP 
    - [Base php-apache Image - php:7.4-apache](https://hub.docker.com/_/php)
