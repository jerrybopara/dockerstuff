## WordPress + MySql:5.7.36 + Dynamic ENV

@Jerry Bopara :+1: Hey !! Docker Compose :) :shipit:

<!--lint disable awesome-toc-->
### Getting started

- Just rename the **sample_.env** to **.env** and update the variables as per your need.
- docker-compose.yml - includes MySql, WordPress, a Custom Network, and .env support.
- MySql Custom Configuration file - docker/MySql/conf.d/my_custom.cnf 
- MariaDB Custom Configuration file - docker/MariaDB/conf.d/my_custom.cnf 

### Container Services & DockerFile 
 1. db 
    - [Base MySql Image - mysql:5.7.36](https://hub.docker.com/_/mysql)
    - [Base MariaDB Image - mariadb:latest](https://hub.docker.com/_/mariadb)

 2. wordpress
    - [Base WordPress Image - wordpress:latest](https://hub.docker.com/_/wordpress)
        - [Built on - PHP:7.4-apache](https://hub.docker.com/_/php)