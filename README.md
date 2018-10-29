------
# Install Kubernetes in Iran without sanctions
This script helps you to install kubernetes (kubectl and minikube) without pain in Iran from official repository of Kubernetes (Google).

How to use it?

`
$ git clone https://github.com/danitfk/installKubernetesIran
$ cd installKubernetesIran
$ ./kubectl.sh
$ ./minikube.sh
`
To define virtualization in minikube you can use this;
`
$ ./setup-minikube.sh virtualbox
OR
$ ./setup-minikube.sh kvm
`
then start minikube to create first minikube service:
`
$ ./setup-minikube.sh
`

Pull requests are welcomed. :)
 
