# mac 

桌面版本
https://github.com/rancher-sandbox/rancher-desktop/releases

# multipass 版本
~~~~shell
# 物理机执行
brew install --cask multipass
cp /Users/lv/Library/Caches/Homebrew/downloads/f38bc839600d8accfa2c9bbd6d3f47844573cdf395ca624d2e00e138a5208304--multipass-1.8.1\ mac-Darwin.pkg /Users/lv/Library/Caches/Homebrew/downloads/f38bc839600d8accfa2c9bbd6d3f47844573cdf395ca624d2e00e138a5208304--multipass-1.8.1+mac-Darwin.pkg
brew install --cask multipass
multipass
multipass version
multipass launch --name k3s --mem 1G --disk 5G
multipass list
~~~~

~~~~shell
# 进入虚拟机
multipass shell k3s
ubuntu@k3s:~$ curl -sfL https://get.k3s.io | sh -
# 修改权限
ubuntu@k3s:~$ sudo chmod 644 /etc/rancher/k3s/k3s.yaml
ubuntu@k3s:~$ kubectl get nodes
NAME   STATUS   ROLES                  AGE   VERSION
k3s    Ready    control-plane,master   11m   v1.22.6+k3s1
~~~~

~~~~shell
# 物理机执行
# 挂载整个物理机的home到虚拟机
lv@jinju learning-k3s % multipass mount $HOME k3s
lv@jinju learning-k3s % multipass shell k3s
ubuntu@k3s: cd /Users/
ubuntu@k3s: ls -all

~~~~

安装其他节点
~~~~shell
ubuntu@k3s:~$ sudo cat /var/lib/rancher/k3s/server/node-token
K109dddfa3455f9a01fe5bfa5cdd23848831dfb2d136575178010df4b51a6ce5e31::server:95ac8bffb90d79dbfbdd8cecf6d0d3a4

# 第二个虚拟机
ubuntu@k3s-work:~$ curl -sfL https://get.k3s.io | K3S_URL=https://192.168.64.2:6443 K3S_TOKEN=K109dddfa3455f9a01fe5bfa5cdd23848831dfb2d136575178010df4b51a6ce5e31::server:95ac8bffb90d79dbfbdd8cecf6d0d3a4 sh -
~~~~

