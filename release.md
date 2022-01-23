# 版本更新内容

## spray-v2.18.5-5_k8s-v1.23.1_v1.4-amd64

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