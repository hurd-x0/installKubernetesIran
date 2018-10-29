#!/bin/bash
# Author: Daniel Gordi (danitfk)
# Date: 29/Oct/2018

PROXY_SERVER_ADDR="lab.gordi.ir"
PROXY_SERVER_PORT="60666"
function set_proxy {
export http_proxy="http://$PROXY_SERVER_ADDR:$PROXY_SERVER_PORT"
export https_proxy="http://$PROXY_SERVER_ADDR:$PROXY_SERVER_PORT"
echo "Detect IP Address"
HTTP_IP=`curl -s http://ifconfig.me`
PROXY_IP=`host lab.gordi.ir | grep -o "address.*" | awk {'print $2'}`
echo "Proxy IP is: $PROXY_IP"
if [[ "$PROXY_IP" != "$HTTP_IP" ]]
then
	echo "Proxy not set correctly"
	sleep 0.1
	echo "Exit"
	exit 1
fi
}
function kube_install {
curl -Lo minikube https://storage.googleapis.com/minikube/releases/v0.30.0/minikube-linux-amd64 && chmod +x minikube && sudo cp minikube /usr/local/bin/ && rm minikube

}
function unset_proxy {
export http_proxy=""
export https_proxy=""
}

# RUN SCRIPT
unset_proxy && set_proxy && kube_install && unset_proxy
