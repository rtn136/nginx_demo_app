#!/bin/bash


echo "===================================Applying configurations============================================="
kubectl apply -f nginx_k8s_app.yml
echo -e "\n\nApplication running at http://$(curl http://checkip.amazonaws.com):31000\n\n"