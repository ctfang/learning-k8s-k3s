# 说明
1. k8s是一套集群编排系统
2. 可以理解为docker-compose的多机器管理版本


# 概念
1. pod 是最小可调度单元
2. service 提供外部访问服务，负载均衡
3. php脚本项目, 镜像大的, 使用两个容器解耦, 使用BusyBox作为Init Containers打包代码同时共享到运行容器pod
4. 自带RollingUpdate等启动方式, 方便滚动发布
5. Deployment自定义log收集

# 常用
kubectl get pods -o wide --all-namespaces
