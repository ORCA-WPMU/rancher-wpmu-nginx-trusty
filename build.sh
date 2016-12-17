#!/bin/bash

if [ "x$1" == "x" ]; then
  CACHE="--no-cache"
else
  CACHE=""
fi

DATE=$(date +%Y%m%d.%H%M)
echo "Building docker-wpmu-nginx:trusty.$DATE"
docker build $CACHE -t="stormerider/docker-wpmu-nginx:trusty.$DATE" .
echo ""
echo "Building docker-wpmu-nginx:latest"
docker build -t="stormerider/docker-wpmu-nginx:latest" .
echo ""
#echo "Building docker-wpmu-nginx:xenial.$DATE"
#docker build $CACHE -t="stormerider/docker-wpmu-nginx:xenial.$DATE" . -f Dockerfile-xenial
#echo ""
#echo "Building docker-wpmu-nginx:xenial"
#docker build -t="stormerider/docker-wpmu-nginx:xenial" . -f Dockerfile-xenial
#echo ""
echo "Pushing docker-wpmu-nginx:trusty.$DATE"
docker push stormerider/docker-wpmu-nginx:trusty.$DATE
echo ""
echo "Pushing docker-wpmu-nginx:latest"
docker push stormerider/docker-wpmu-nginx:latest
echo ""
#echo "Pushing docker-wpmu-nginx:xenial.$DATE"
#docker push stormerider/docker-wpmu-nginx:xenial.$DATE
#echo ""
#echo "Pushing docker-wpmu-nginx:xenial"
#docker push stormerider/docker-wpmu-nginx:xenial
