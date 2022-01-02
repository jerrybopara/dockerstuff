## WordPress + MySql:5.7.36 + Dynamic ENV

@Jerry Bopara :+1: Hey !! Docker Compose :) :shipit:

<!--lint disable awesome-toc-->
### Getting started

- Just rename the **sample_.env** to **.env** and update the variables as per your need.
- docker-compose.yml - includes MySql, WordPress, a Custom Network, and .env support.
- 

├── conf.d
├── docker
│   ├── conf.d
│   │   └── mysqld.cnf
│   ├── Dockerfile-MariaDB
│   ├── Dockerfile-MySql
│   └── init.sql
├── docker-compose.yml
├── README.md
└── sample_.env