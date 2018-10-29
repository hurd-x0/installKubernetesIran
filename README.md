------
# نصب کوبرنتیز بدون مشکل تحریم در ایران
این اسکریپت به شما کمک میکنه که کوبرنتیز رو در شبکه های داخلی ایران که نمیتونند از سرورهای گوگل فایل دانلود کنند رو نصب کنید.
------

# Install Kubernetes in Iran without sanctions
This script helps you to install kubernetes (kubectl and minikube) without pain in Iran from official repository of Kubernetes (Google).

How to use it?

`$ git clone https://github.com/danitfk/installKubernetesIran`

`$ cd installKubernetesIran`

`$ ./kubectl.sh`

`$ ./minikube.sh`

To define virtualization in minikube you can use this:

(Virtualbox)

`$ ./setup-minikube.sh virtualbox`

OR

(KVM Virtualization)

`$ ./setup-minikube.sh kvm`

then start minikube to create first minikube service:

`$ ./setup-minikube.sh`

Pull requests are welcomed. :)
 
