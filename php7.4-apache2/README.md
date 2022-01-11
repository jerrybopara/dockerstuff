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

# Domain Name 
DOMAIN=website1.localhost.com

# Location of Web Directory 
WebDir=public_html

# Select the PHP Verison you needed - php74 OR php56
PHP=php74

# HTTP & HTTPS HOST PORTS
HOST_HTTP_PORT=1180
HOST_HTTPS_PORT=11443

# Apache Vhost Configuration
APACHE_CONF=000-default.conf

# SSL Volume
SSL_VOLUME=ssl_certs

# Apache Log Directory 
APACHE_LOG_VOLUME=logs

# Name the Local Network 
Local_Network=My_Local_Network
```

- PHP Configuration file - ./docker/php.ini 

## Container Services & DockerFile 
 1. **PHP Base Image**
    - [Base Image - php:7.4-apache](https://hub.docker.com/_/php)


 2.  **DockerFile's** 
   - ./docker/Dockerfile-php56
   - ./docker/Dockerfile-php74

- **Apache Virtual Host Config File [Includes SSL Vhost as well]** 
   - ./docker/000-default.conf 

- **SSL Certificate (Self Singed SSL Certificate's)**
   > NOTE: I'm using Self-Singed SSL Certificate in this demostration. Creating locally trusted SSL Certificates
   with [**MKCERT**](https://github.com/FiloSottile/mkcert)

   - SSL Directory: 
   - Shell Script Install & Configure [**MKCERT**](https://github.com/FiloSottile/mkcert) 
   - ./docker/install-ssl.sh 

   ```
   # Copying mkcert install script (install-ssl.sh) and setting up SSL.
   
   COPY ./docker/install-ssl.sh /etc/apache2/ssl_certs/
   RUN cd /etc/apache2/ssl_certs/ && chmod u+x install-ssl.sh && \
	./install-ssl.sh 
   ```   

## Docker-Compose Build CMD with Build Date.
```
$ docker-compose build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ'
```