#!/bin/bash


echo "===================================Removing existing image============================================="
docker rmi -f nginx_app_img
echo "===================================Buidling new image============================================="
docker build -t nginx_app_img .
echo "===================================Removing existing container============================================="
docker rm -f $(docker stop nginx_app_cont)
echo "===================================Running new container============================================="
docker run -itd --name nginx_app_cont -p 8090:80 nginx_app_img
echo -e "\n\nImage built and container should be running at $(curl http://checkip.amazonaws.com):8090"