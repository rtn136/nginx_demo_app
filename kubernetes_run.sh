#!/bin/bash

echo "===================================Applying configurations============================================="
kubectl apply -f nginx_k8s_app.yml;
echo -e "\n\nApplication running... Try: \n\nhttp://$(curl -s http://checkip.amazonaws.com):31000\nhttp://$(curl -s http://checkip.amazonaws.com):31000/solution\nhttp://$(curl -s http://checkip.amazonaws.com):31000/fashion\n\n"
