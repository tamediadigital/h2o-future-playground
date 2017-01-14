#!/bin/sh
docker-machine start
eval $(docker-machine env)
docker build -t h2o-future-image:latest .
docker run --name h2o-redis -d redis


REDIS=$(docker run --name=h2o-redis -d redis:latest)
if [ $? -eq 0 ]; then #fuck docker
    echo OK
else
    docker start h2o-redis
fi

H2O=$(docker run -p 8080:8080 --link=h2o-redis -d h2o-future-image:latest)
curl $(docker-machine ip):8080
docker stop $H2O h2o-redis 
 