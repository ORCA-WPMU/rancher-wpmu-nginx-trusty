#!/bin/bash
DATE=$(date +%Y%m%d.%H%M)
docker build -t="stormerider/docker-wpmu-nginx:trusty.$DATE" .
docker build -t="stormerider/docker-wpmu-nginx:latest" .
docker build -t="stormerider/docker-wpmu-nginx:xenial.$DATE" . -f Dockerfile-xenial
docker build -t="stormerider/docker-wpmu-nginx:xenial" . -f Dockerfile-xenial
docker push stormerider/docker-wpmu-nginx:trusty.$DATE
docker push stormerider/docker-wpmu-nginx:latest
docker push stormerider/docker-wpmu-nginx:xenial.$DATE
docker push stormerider/docker-wpmu-nginx:xenial
