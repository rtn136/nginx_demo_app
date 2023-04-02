#!/bin/bash

docker rmi nginx_app_img
docker build -t nginx_app_img .
docker rm $(docker stop nginx_app_cont)
docker run -itd --name nginx_app_cont -p 8090:80 nginx_app_img
echo "Image built and container is running at $(curl http://checkip.amazonaws.com):8090"