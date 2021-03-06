# docker-wpmu-nginx

A Dockerfile that installs the latest wordpress in a multisite configuration, nginx, php-apc and php-fpm.

A big thanks to [jbfink](https://github.com/jbfink/docker-wordpress) who did most of the hard work on the wordpress parts!

You can check out his [Apache version here](https://github.com/jbfink/docker-wordpress).

And this is also based on [eugeneware](https://github.com/eugeneware/docker-wordpress-nginx)'s Nginx variant.

## Installation

The easiest way to get this docker image installed is to pull the latest version
from the Docker registry:

```bash
$ docker pull stormerider/rancher-wpmu-nginx-trusty
```

If you'd like to build the image yourself then:

```bash
$ git clone https://github.com/stormerider/rancher-wpmu-nginx-trusty.git
$ cd rancher-wpmu-nginx-trusty
$ sudo docker build -t="stormerider/rancher-wpmu-nginx-trusty" .
```

## Usage

This is intended for use under Rancher with an external MySQL database (such as Amazon's RDS) and a shared filesystem like EFS. You can use a docker-compose file like so:

```yaml
version: '2'
services:
  wp:
    image: stormerider/rancher-wpmu-nginx-trusty
    environment:
      WORDPRESS_DB_HOST: myrds.us-west-2.rds.amazonaws.com:3306
      WORDPRESS_DB_NAME: mywordpress_wp
      WORDPRESS_DB_PASS: SOMEPASSWORD
      WORDPRESS_DB_PRFX: wp_
      WORDPRESS_DB_USER: mywordpress_user
      WORDPRESS_MU_DOM: mydomain.com
      WORDPRESS_AUTH_KEY: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
      WORDPRESS_SECURE_AUTH_KEY: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
      WORDPRESS_LOGGED_IN_KEY: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
      WORDPRESS_NONCE_KEY: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
      WORDPRESS_AUTH_SALT: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
      WORDPRESS_SECURE_AUTH_SALT: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
      WORDPRESS_LOGGED_IN_SALT: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
      WORDPRESS_NONCE_SALT: XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
    volumes:
    - /home/rancher/efs/mydomain.com/wp-content:/usr/share/nginx/www/wp-content
    ports:
    - 80:80/tcp
    command:
    - /bin/bash
    - /start.sh
    labels:
      io.rancher.container.pull_image: always
```

Add that as a new service, or write it to docker-compose.yaml and use docker-compose like so:

```bash
$ sudo docker-compose up -d
```

After starting the rancher-wpmu-nginx check to see if it started and the port mapping is correct.  This will also report the port mapping between the docker container and the host machine.

```
$ sudo docker ps

0.0.0.0:80 -> 80/tcp rancher-wpmu-nginx-trusty
```

You can the visit the following URL in a browser on your host machine to get started:

```
http://127.0.0.1:80
```
