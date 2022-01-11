## PHP 7.4 + Apache2 + Dynamic ENV + Self Signed SSL

@Jerry Bopara :+1: Hey !! Docker Compose :) :shipit:

<!--lint disable awesome-toc-->
### Getting started

- Just rename the **sample_.env** to **.env** and update the variables as per your need.
- Once done you can build your image and run the docker container.

## Docker-Compose Build CMD with Build Date.
```
$ docker-compose build --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ'
```

- docker-compose.yml - Explanation & Guide to setup Self Singed SSL Certificate.
   - Includes Service: Apache-php, Exposed Port 80,443 & Self Signed SSL & Custom Network.
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


 2. **DockerFile's** 
    - ./docker/Dockerfile-php56
    - ./docker/Dockerfile-php74

    - Apache Virtual Host Config File [Includes SSL Vhost as well]
      - ./docker/000-default.conf 

 3. **SSL Certificate (Self Singed SSL Certificate's)**
     > NOTE: I'm using Self-Singed SSL Certificate in this demostration. Creating locally trusted SSL Certificates with [**MKCERT**](https://github.com/FiloSottile/mkcert)
   
    - SSL Directory: ./docker/ssl_certs/
    - Shell Script Install & Configure [**MKCERT**](https://github.com/FiloSottile/mkcert) 
    - ./docker/ssl_certs/install-ssl.sh 
    
     ```
      # Copying mkcert install script to container.
      COPY ./docker/ssl_certs/install-ssl.sh /etc/apache2/ssl_certs/
      RUN chmod a+x /etc/apache2/ssl_certs/install-ssl.sh
     ```   
     > By Default container got lauched with **HTTP** Only, but to enable the Self Signed SSL Certificate. 

     > Just run the following commands and your self signed SSL will be ready. **(Replace CONTAINER-ID with your real container ID)**
     ```
     $ docker exec -ti CONTAINER-ID bash -c "/etc/apache2/ssl_certs/install-ssl.sh"
     ``` 
     > Once SSL issued, you will see the Certificates at 
     ```
     $ ls ./docker/ssl_certs/
      -rw------- 1 xxxx  xxxx  1704 Jan 11 23:45 localhost+2-key.pem
      -rw-r--r-- 1 xxxx  xxxx 1497 Jan 11 23:45 localhost+2.pem 
     ```   
     > Now Just enable the SSL Virtual Host at Apache config => **./docker/000-default.conf** & reload the apache service.
     ```
     $ docker exec -ti CONTAINER-ID bash -c "/etc/init.d/apache2 reload" 
     ```
      
