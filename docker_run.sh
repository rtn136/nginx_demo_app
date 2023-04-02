#!/bin/bash


echo "Removing existing image..."
docker rmi nginx_app_img
echo "Buidling new image..."
docker build -t nginx_app_img .
echo "Removing existing container..."
docker rm $(docker stop nginx_app_cont)
echo "Running new container..."
docker run -itd --name nginx_app_cont -p 8090:80 nginx_app_img
echo "Image built and container is running at $(curl http://checkip.amazonaws.com):8090"


