clear
ls
ls -a
clear
vim install_kind.sh
chmod 777 install_kind.sh
ls 
./install_kind.sh
clear
pwd
docker -version
docker --version
kind --version
minicube --version
clear
docker ps
kubectl version
clear
docker --version
docker ps
clear
kind --version
kubectl version
sudo vim demo.yml
sudo rm demo.yml
ls
mkdir kind_cluster
ls
cd kind_cluster
ls
clear
sudo vim config.yml
ls 
kind create cluster --name=demo-cluster --config=config.yml
cat config.yml
sudo vim config.yml
kind create cluster --name=demo-cluster --config=config.yml
kubctl cluster-info --context kind-demo-cluster
kubectl cluster-info --context kind-demo-cluster
clear
kubectl get nodes
docker ps
clear
pwd
ip a
clear
kubctl status
kubectl status
docker ps
ping google.com
curl http://localhost:3000
ss -tulnp
netstat -tulnp
sudo apt install net-tools
netstat -tulnp
nslookup google.com
nslookup praveen.shop
nslookup youtube.com
nslookup praveentomar.shop
clear
telnet google.com 80
telnet google.com 443
telnet google.com 3000
ns -tulnp
ss -tulnp
docker ps
clear
ss -tulnp | grep 3000
ss -tulnp | grep 80
clear
traceroute google.com
sudo apt install traceroute
traceroute google.com
clear
ifconfig
clear
kind version
docker --version
minikube -version
minikube --version
minikube version
kubectl get nodes
ls
cd kind_cluster
ls
cat config.ym
cat config.yml
sudo cat ../install_kind.sh
cat config.ym
cat config.yml
ls
cd kind_cluster
ls
kubectl cluster-info
kubectl config get-cintexts
kubectl config get-contexts
kubectl config use-context kind-demo-cluster
kubectl get nodes
clear
clear
ls
mkdir kind_cluster
cd kind_cluster
ls
ls -a
clear
netstat -tuln
ss -tuln
clear
kubectl cluster info
kubectl cluster-info
clear
ls
mkdir kubernetes
ls
cd kubernetes
ls
ls -a
kubectl gets namespace
kubectl get ns
clear
kubectl get ns
kubectl get pods
kubectl get ns
kubectl get pods -n kube-system
clear
kubectl get pods -n kube-system
kubectl create ns nginx
kubectl get ns
kubectl run nginx --image=nginx
kubectl get pods
kubectl get pods -n nginx
kubectl delete pod nginx
kubectl run nginx --image=nginx -n nginx
kubectl get pods -n nginx
kubectl delete pod nginx -n nginx
kubectl get pods -n nginx
clear
kubectl delete ns nginx
mkdir nginx
ls
cd nginx
ls
sudo vim namespace
mv namespace namespace.yml
ls
sudo vim namespace.yml
kubectl apply-f namespace.yml
kubectl apply -f namespace.yml
cat namespace.yml
cd ..
ls
cd kind_cluster
ls
cat config.yml
cd ..
cd kubernetes
cd ngonx
cd nginx
cat namespace.yml
kubectl apply -f namespace.yml
cat namespace.yml
sudo vim namespace.yml
kubectl apply -f namespace.yml
kubectl get ns
sudo vim pod.yml
ls
kubectl apply -f pod.yml
ls
kubectl apply -f pod.yml
cat pod.yml
kubectl apply -f pod.yml
sudo vim pod.yml
kubectl apply -f pod.yml
kubectl get pods
kubectl get pod -n nginx
kubectl exec -it nginx-pod -n nginx -- base
kubectl exec -it nginx-pod -n nginx -- bash
sudo ss -tulnp | grep :80
kubectl exec -it nginx-pod -n nginx -- bash
kubectl describe nginx-pod -n nginx
kubectl describe pod/nginx-pod -n nginx
clear
ls
cd kubernetes
ls
cd nginx
ls
cat pod.yl
cat pod.yml
kubectl describe pod/nginx-pod -n nginx
clear
sudo vim deployment.yml
kubectl apply -f deployment.yml
ls
kubectl delete -f pod.yml
ls
kubectl get pods -n nginx
clear
sudo vim deployment.yml
kubectl apply -f deployment.yml
kubectl get deployment -n nginx
kubectl get pods
kubectl get pods -n nginx
kubectl scale deployment/nginx-deployment -n nginx --replicas=5
kubectl get pods
kubectl get pods -n nginx
kubectl scale deployment/nginx-deployment -n nginx --replicas=1
kubectl get pods -n nginx
clear
pwd
clear
pwd
ls
clear
ls
cd kubernetes
ls
cd nginx
ls
kubectl get pods -n nginx
kubectl describe pod/nginx-pod -n nginx
clea
kubectl get pods -n nginx -o wide
clear
cd kubernetes
cd nginx
ls
kubectl get pods -n nginx
kubectl get pods -n nginx -o wide
cd kubernetes
cd nginx
clear
cp deployment.yml replicasets.yml
ls
sudo vim replicasets.yml
ls
kubectl apply -f replicasets.yml
ls
kubectl get replicasets -n nginx
clear
clear
cd kubernetes
cd nginx
ls
clear
kubectl get pods -n nginx -o wide
kubectl set image deployment/deployment-nginx -n nginx nginx=nginx:1.27.3
kubectl get pods -n nginx -o wide
kubectl set image deployment/nginx-deployment -n nginx nginx=nginx:1.27.3
kubectl get pods -n nginx -o wide
clear
kubectl scale deployment/nginx-deployment -n nginx --replicas=5
kubectl get pods -n nginx -o wide
kubectl set image deployment/nginx-deployment -n nginx nginx=nginx:1.27.3
kubectl get pods -n nginx -o wide
kubectl set image deployment/nginx-deployment -n nginx nginx=nginx:1.27.1
kubectl get pods -n nginx -o wide
kubectl delete -f deployment.yml
kubectl get pods -n nginx -o wide
clear
pwd
ls -a
cd kubernetes
cd nginx
clear
ls
kubectl get replicasets
kubectl get replicasets -n nginx
kubectl delete -f replicasets.yml
sudo vim daemonsets.yml
cp replicasets.yml daemonsets.yml
ls
cp replicasets.yml daemonsets.yml
replicasets.yml>> daemonsets.yml
cat replicasets.yml > daemonsets.yml
sudo cat replicasets.yml > daemonsets.yml
sudo cp replicasets.yml daemonsets.yml
sudo vim daemonsets.yml
kubectl apply -f daemonsets.yml
clear
kubectl get pods -n nginx
kubectl get pods -n nginx -o wide
kubectl delete -f daemonsets.yml
clear
cd kubernetes
cd nginx
clear
sudo vim job.yml
kubectl apply -f job.yml
sudo vim job.yml
kubectl apply -f job.yml
sudo vim job.yml
kubectl apply -f job.yml
kubectl get job -n nginx
kubectl log pod/demo-job -n nginx
kubectl logs pod/demo-job -n nginx
kubectl logs pod/demo-job-qqrkh -n nginx
kubectl logs pod/demo-job -n nginx
clear
kubectl get job -n nginx
kubectl get pods -n nginx
kubectl logs pod/demo-job-vzj2n -n nginx
kubectl delete -f job.yml
kubectl get pods -n nginx
sudo vim cron-job.yml
kubectl apply -f cron-job.yml
sudo vim cron-job.yml
kubectl apply -f cron-job.yml
sudo vim cron-job.yml
kubectl apply -f cron-job.yml
sudo vim cron-job.yml
kubectl apply -f cron-job.yml
sudo vim cron-job.yml
kubectl apply -f cron-job.yml
sudo vim cron-job.yml
kubectl apply -f cron-job.yml
sudo vim cron-job.yml
kubectl apply -f cron-job.yml
sudo vim cron-job.yml
kubectl apply -f cron-job.yml
ls
kubectl get cronjob -n nginx
kubectl get pods -n nginx
kubectl logs pods/minute-backup-29546916-hmdc4 -n nginx
sudo vim cron-job.yml
kubectl apply -f cron-job.yml
kubectl get pods -n nginx
sudo vim cron-job.yml
kubectl get pods -n nginx
ls
kubectl get pods -n nginx
kubectl delete -f cronjob.yml
ls
kubectl delete -f cron-job.yml
