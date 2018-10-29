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
echo "IP Address is: $HTTP_IP"
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
function unset_proxy {
export http_proxy=""
export https_proxy=""
}
function check_minikube {
if [[ -f /usr/local/bin/minikube ]]
then
	echo "Minikube check -> PASS"
else
	echo "Minikube is not installed"
	exit 1

fi

}
function help {
        echo "You have to choose one of virtualization type such as virtualbox or kvm nor you have to start minikube"
        echo "Eg: ./setup-minikube.sh virtualbox"
        echo "Eg: ./setup-minikube.sh kvm"
        echo "Eg: ./setup-minikube.sh start"

}
if [[ "$1" == "" ]]
then
	help
        exit 1
fi

if [[ "$1" == "kvm" ]]
then
	echo "KVM Virtualization enabled"
	echo "kvm" > .virt-type
fi

if [[ "$1" == "virtualbox" ]]
then
	echo "Virtualbox enabled"
	echo "virtualbox" > .virt-type
fi

if [[ "$1" == "start" ]]
then
	echo "Check Virt-type"
	if [[ -f ./.virt-type ]]
	then
		virt_type=`cat ./.virt-type`
		set_proxy
		check_minikube
		sudo chown -R $USER:$USER $HOME/.minikube/
		minikube config set vm-driver $virt_type
		minikube start
		unset_proxy
	else
		echo "First define virtualization type"
		help
		exit 1
	fi

fi
