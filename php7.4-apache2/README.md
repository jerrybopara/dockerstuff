## PHP 7.4 + Apache2 + Dynamic ENV

@Jerry Bopara :+1: Hey !! Docker Compose :) :shipit:

<!--lint disable awesome-toc-->
### Getting started

- Just rename the **sample_.env** to **.env** and update the variables as per your need.
- docker-compose.yml 
   - Includes Service: Apache-php, Exposed Port 80,443 & Custom Network.
   - .env environment variable's
      - ContainerName 
      - WebDir 
      - ApacheDockerFile
      - Local_Network
```
# Name the Local Network 
Local_Network=My_Local_Network

# Container Name
ContainerName=WebHost01

# Location of Web Directory 
WebDir=public_html

# Choose PHP Verison - php74 OR php56
PHP=php74
```

- php Configuration file - ./docker/php.ini 
- DockerFile's 
   - ./docker/Dockerfile-php56
   - ./docker/Dockerfile-php74

## Container Services & DockerFile 
 1. PHP 
    - [Base php - apache Image - php:7.4-apache](https://hub.docker.com/_/php)
