# learning-k8s-k3s
k3s 和 k8s 的学习笔记, 这里的文档不会照搬官方文档, 只会大概对开发常用的功能进行说明。
本文档的目的会快速了解k8s基础使用

### 介绍
Kubernetes 和 K3s 是开源容器编排平台，它们可以帮助您轻松地部署、扩展和管理应用程序。本文档旨在为读者提供 Kubernetes 和 K3s 的一些核心概念和功能，以便他们能够更好地理解和使用这两个平台。

### Kubernetes的核心特性
#### 自动化部署和扩展
Kubernetes允许您轻松地将应用程序部署到容器中，并通过自动化和自动扩展来确保应用程序在需要时能够快速响应。

#### 自动化容器编排
Kubernetes可以自动编排容器，并确保它们始终在运行中。如果一个容器崩溃或终止，Kubernetes会自动将它重新启动到另一个可用的节点上，以确保应用程序的高可用性。

#### 负载均衡和服务发现
Kubernetes支持负载均衡和服务发现，可以自动为应用程序提供负载均衡和DNS解析服务。这使得应用程序能够轻松地处理更多的流量，并保证应用程序的高可用性。

#### 自动化滚动更新和版本管理
Kubernetes支持自动化滚动更新和版本管理，可以确保应用程序的版本能够无缝地升级到新的版本，而不影响应用程序的可用性和性能。

#### 存储管理
Kubernetes支持多种存储解决方案，包括本地存储、网络存储和云存储。这使得应用程序能够轻松地访问持久化存储，并确保数据的安全性和可靠性。


# 重要概念
#### Pod
Pod 是 Kubernetes 中最小的可调度单元，是一组容器的集合，它们共享相同的网络和存储空间。Pod 的目的是在同一主机上协调应用程序的各个部分。

#### Service
Service 是 Kubernetes 中的一个抽象概念，它为一组 Pod 提供一个统一的入口，并负责实现负载均衡和服务发现。

#### Deployment
Deployment 是 Kubernetes 中用于管理 Pod 的资源对象，它可以确保在集群中运行指定数量的 Pod 副本，并提供滚动升级和回滚功能。

#### StatefulSet
适用于有状态应用程序，StatefulSet可以确保有状态应用程序的唯一性和有序性，例如数据库、缓存等。

#### DaemonSet
适用于需要在每个节点上运行的守护进程，例如日志收集器、监控代理等。

#### Job和CronJob
Job用于批处理作业，例如数据导入、数据备份等。CronJob用于定时执行任务，例如数据清理、数据分析等。

#### ConfigMap和Secret
ConfigMap用于保存应用程序的配置信息，例如数据库连接字符串、API密钥等。Secret用于保存敏感信息，例如密码、证书等，可以在容器中进行安全访问。

#### Kustomize
Kustomize是Kubernetes的另一个配置管理工具，可以用于管理不同环境的应用程序配置，例如测试环境、生产环境等。

横向扩展和纵向扩展：横向扩展是通过增加应用程序的实例数量来扩展应用程序的处理能力，纵向扩展是通过增加应用程序实例的资源来扩展应用程序的处理能力，例如CPU、内存等。

#### Ingress
Ingress用于将外部流量路由到Kubernetes集群内部的服务，可以通过Ingress实现HTTP/HTTPS流量的路由和负载均衡。


# 常用
kubectl get pods -o wide --all-namespaces
kubectl get server -A
kubectl get nodes
kubectl describe pod -n {namespace} {podname}
kubectl top nodes
