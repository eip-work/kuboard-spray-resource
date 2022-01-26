# 版本更新内容

## spray-v2.18.1-0_k8s-v1.23.3_v1.5-amd64

**更新内容**

* 更新 kubernetes 版本到 v1.23.3
* 更新 containerd_version 到 1.5.9
* 更新 crun_version 到 1.4
* 更新 crictl_version 到 v1.23.0
* 更新 coredns_version 到 v1.8.6
* 更新 calico_version 到 v3.21.2
* 更新 metrics_server_version 到 v0.5.2

**问题修正**

* 解决 netcheck_etcd 不能离线下载的问题

## spray-v2.18.0-5_k8s-v1.23.1_v1.4-amd64

**前提条件**

* kuboard-spray 版本不低于 v1.0.0-alpha.5-amd64

**更新内容**

* 配合 kuboard-spray v1.0.0-alpha.5-amd64 及以上版本
  * 可以单独安装可选组件
* 优化
  * 更新 /etc/nginx/nginx.conf 后，检查 nginx 的重启状态
  * 更新 /etc/kubernetes/manifests/kube-apiserver.yaml 中 etcd-server 参数后，检查所有 apiserver 的重启状态
* 问题修正
  * 添加工作节点时，因为缺少 kube-proxy 镜像导致新增的节点不能正常工作的问题
  * 不能正常设置 nginx 参数的问题
  * coredns 最小副本书设定的问题