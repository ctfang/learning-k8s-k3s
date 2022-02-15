# 基础例子

~~~~shell
ubuntu@k3s:~$ kubectl apply -f ./deployment.yaml
ubuntu@k3s:~$ kubectl apply -f ./server.yaml
ubuntu@k3s:~$ kubectl get services -o wide
NAME            TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)        AGE   SELECTOR
kubernetes      ClusterIP   10.43.0.1      <none>        443/TCP        73m   <none>
nginx-service   NodePort    10.43.11.109   <none>        80:30080/TCP   56m   app=nginx
~~~~

~~~~shell
# 物理机执行, 其中 192.168.64.2 就是虚拟机ip
lv@jinju learning-k3s % multipass list
Name                    State             IPv4             Image
k3s                     Running           192.168.64.2     Ubuntu 20.04 LTS
                                          10.42.0.0
                                          10.42.0.1
~~~~
在物理机打开浏览器 
http://192.168.64.2:30080 