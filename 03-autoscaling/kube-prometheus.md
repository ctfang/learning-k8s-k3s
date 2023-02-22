要在 Kubernetes 中安装 Bitnami 的 kube-prometheus，可以按照以下步骤进行操作：

添加 Helm 存储库：运行以下命令添加 Bitnami 的 Helm 存储库。
````shell
````shell
helm repo add bitnami https://charts.bitnami.com/bitnami
````
创建命名空间：为 kube-prometheus 创建一个新的命名空间，例如 monitoring。

````shell
kubectl create namespace monitoring
````
下载并更新 chart：下载 kube-prometheus Helm Chart 并更新。
sql
````shell
helm repo update
````
安装 Chart：使用以下命令安装 kube-prometheus。

````shell
helm install kube-prometheus bitnami/kube-prometheus -n monitoring
````
等待部署完成：等待 kube-prometheus 部署完成。

访问 Grafana：使用以下命令访问 Grafana 控制台。


````shell
kubectl port-forward --namespace monitoring $(kubectl get pods --namespace monitoring -l "app.kubernetes.io/name=grafana" -o jsonpath="{.items[0].metadata.name}") 3000
````
然后在浏览器中访问 http://localhost:3000，使用默认的用户名和密码 admin 登录。

查看 Prometheus：使用以下命令查看 Prometheus 控制台。

````shell
kubectl port-forward --namespace monitoring $(kubectl get pods --namespace monitoring -l "app=prometheus,component=server" -o jsonpath="{.items[0].metadata.name}") 9090
````
然后在浏览器中访问 http://localhost:9090，即可查看 Prometheus 控制台。

卸载 Chart：使用以下命令卸载 kube-prometheus。
````shell
helm uninstall kube-prometheus -n monitoring
````
以上是安装和卸载 kube-prometheus 的基本步骤。如果需要进行更多自定义设置，请参考 Bitnami kube-prometheus 的官方文档。