# docker-wpmu-nginx

A Dockerfile that installs the latest wordpress in a multisite configuration, nginx, php-apc and php-fpm.

NB: A big thanks to [jbfink](https://github.com/jbfink/docker-wordpress) who did most of the hard work on the wordpress parts!

You can check out his [Apache version here](https://github.com/jbfink/docker-wordpress).

## Installation

The easiest way to get this docker image installed is to pull the latest version
from the Docker registry:

```bash
$ docker pull stormerider/docker-wpmu-nginx
```

If you'd like to build the image yourself then:

```bash
$ git clone https://github.com/stormerider/docker-wpmu-nginx.git
$ cd docker-wpmu-nginx
$ sudo docker build -t="stormerider/docker-wpmu-nginx" .
```

## Usage

To spawn a new instance of wordpress on port 80.  The -p 80:80 maps the internal docker port 80 to the outside port 80 of the host machine.

```bash
$ sudo docker run -p 80:80 --name docker-wpmu-nginx -d stormerider/docker-wpmu-nginx
```

Start your newly created docker.

```
$ sudo docker start docker-wpmu-nginx
```

After starting the docker-wpmu-nginx check to see if it started and the port mapping is correct.  This will also report the port mapping between the docker container and the host machine.

```
$ sudo docker ps

0.0.0.0:80 -> 80/tcp docker-wpmu-nginx
```

You can the visit the following URL in a browser on your host machine to get started:

```
http://127.0.0.1:80
```
