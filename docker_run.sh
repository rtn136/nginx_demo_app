#!/bin/bash


echo "===================================Removing existing image============================================="
docker rmi -f nginx_app_img ratanmd/nginx_app_img:v1
echo "===================================Buidling new image=================================================="
docker build -t nginx_app_img .
echo "===================================Tagging new image==================================================="
docker tag nginx_app_img ratanmd/nginx_app_img:v1
echo "===========================Pushing tagged image into registry=========================================="
docker push ratanmd/nginx_app_img:v1
read -p 'Run container? (y/n)' run_cont

if [ run_cont == "y" ];then
    echo "===================================Removing existing container========================================="
    docker rm -f $(docker stop nginx_app_cont)
    echo "===================================Running new container==============================================="
    docker run -itd --name nginx_app_cont -p 8090:80 nginx_app_img
    echo -e "\n\nImage built and container should be running at $(curl http://checkip.amazonaws.com):8090\n\n"

elif [ run_cont == "n" ];then
    echo -e "\n\nImage built and pushed into registry. You have chosen not to run the container.\n\n"

else
    echo -e "\n\nImage built and pushed into registry. You did not provide proper response. Container is not running.\n\n"
fi