## WordPress + MySql:5.7.36 + Dynamic ENV

@Jerry Bopara :+1: Hey !! Docker Compose :) :shipit:

<!--lint disable awesome-toc-->
> ### Getting started

- Copy the sample_.env file to .env
- Customize the **.env** file as per your local setup.

> Use  **docker-compose.yml** - if you only want to run app container. 
- docker-compose.yml
```
$ docket-compose up -d
$ docker ps -a
```


- **docker** - directory contains the all container setup files.

```
docker
├── Dockerfile-WordPress
├── MariaDB
│   ├── conf.d
│   │   └── my_custom.cnf
│   ├── Dockerfile-MariaDB
│   └── init.sql
└── MySql
    ├── conf.d
    │   └── my_custom.cnf
    ├── Dockerfile-MySql
    └── init.sql

```

> Directories Contains the WordPress Files & Database Volume.
```
 - public_html
 - DB_Volumes
```

- docker-compose.yml - includes MySql, WordPress, a Custom Network, and .env support.
```
- WordPress dockerfile - docker/Dockerfile-WordPress 
- MySql Custom Configuration file - docker/MySql/conf.d/my_custom.cnf 
- MariaDB Custom Configuration file - docker/MariaDB/conf.d/my_custom.cnf 
```
>### Container Services & DockerFile 
 1. db 
    - [Base MySql Image - mysql:5.7.36](https://hub.docker.com/_/mysql)
    - [Base MariaDB Image - mariadb:latest](https://hub.docker.com/_/mariadb)

 2. wordpress
    - [Base WordPress Image - wordpress:latest](https://hub.
    docker.vcom/_/wordpress)

