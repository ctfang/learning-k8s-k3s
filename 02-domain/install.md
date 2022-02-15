# 环境准备k8s

删除所有虚拟机重新开始

## 虚拟机安装

./init.sh

# 免密码登录(每个虚拟机都设置)
## 每个机器修改可以远程登录
vim /etc/ssh/sshd_config
PasswordAuthentication no 改成 PasswordAuthentication yes 
PermitRootLogin prohibit-password 修改为 PermitRootLogin yes
### 修改密码
root@dante:~# service sshd restart
root@dante:~# passwd root

## 需要登录对方的机器上设置
~~~~
ssh-keygen -t ed25519 -N '' -f ~/.ssh/id_ed25519
ssh-copy-id $IPs #$IPs为所有节点地址包括自身，按照提示输入yes 和root密码
# 例子 ssh-copy-id 192.168.64.5 后输入 123456789
~~~~

# 一键安装
使用 sealos 安装
~~~~
sealos init --passwd '123456789' \
--master 192.168.64.5  \
--node 192.168.64.9 \
--pkg-url /root/kube1.22.0.tar.gz \
--version v1.22.0
~~~~

# 一些文档
1. 部署一个原生态nginx应用 kubectl apply -f deployment.yaml 
2. 当前nginx只能集群内部访问, 为了方便添加一个域名访问
3. 方便管理使用 NGINX Ingress Controller
   1. 安装 文档 https://kubernetes.github.io/ingress-nginx/deploy/
   2. 使用裸机方式
~~~~shell
# 文档快捷安装
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.1/deploy/static/provider/baremetal/deploy.yaml
# 文档安装的无法公开80端口, 需要修改一下
# 
wget https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.1/deploy/static/provider/baremetal/deploy.yaml
mv deploy.yaml ingress-nginx.yaml

# https://github.com/kubernetes/ingress-nginx/issues/4799
# 打开文件修改, 401行添加；hostNetwork: true
# 修改后
      serviceAccountName: ingress-nginx
      terminationGracePeriodSeconds: 300
      hostNetwork: true
      volumes:
        - name: webhook-cert
          secret:
            secretName: ingress-nginx-admission
~~~~
~~~~
kubectl apply -f ingress-nginx.yaml
kubectl apply -f nginx-ingress.yaml
# 查看nginx被哪个节点调度到了, 域名配置到访问机器hosts
kubectl describe service -n ingress-nginx ingress-nginx-controller
~~~~

就可以使用域名nginx.kube.com访问了

#


    