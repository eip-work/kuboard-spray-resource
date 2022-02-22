# 版本更新内容

**新特性**
* 升级集群时，对于单个节点： （kuboard-spray 版本不能低于 v1.0.0-beta.3）
  * 可以在升级节点前手工排空节点
  * 可以在升级节点后恢复节点调度

## spray-v2.18.0a-6_k8s-v1.23.4_v1.7


**发布日期**

2021-02-20

**更新内容**

* 版本升级
  * kube-version: v1.23.4
  * containerd: 1.6.0
  * pause: 3.6
  * nerdctl: 0.17.0
  * calico: v3.21.4
  * runc: v1.1.0
* 安装前检查操作系统是否在支持的列表中
* kube-bench CIS 扫描
  * 匹配 kube-bench CIS 扫描规则
* 部署 kube-bench
  * 匹配 kube-bench 的扫描规则
* amd64 适配操作系统
  * 适配 OracleLinux 8.5
  * 适配 Anolis 8.5
  * 适配 Rocky 8.5
  * 适配 中标麒麟 V10
  * 适配 openSUSE Leap 15.3
* arm64 版本
  * arm64 环境下不支持 netchecker
  * arm64 环境下支持容器引擎 containerd
  * 适配 CentOS 7.9
  * 适配 OracleLinux 8.5
  * 适配 Anolis 8.5
  * 适配 Rocky 8.5
  * 适配 中标麒麟 V10
  * 适配 openSUSE Leap 15.3

## spray-v2.18.0a-2_k8s-v1.23.3_v1.6

**发布时间**

2021-02-06

**更新内容**

* 提示用户忽略正常情况下的错误提示信息
* 适配 kuboard-spray:v1.0.0-beta.1 的新特性
  * 支持卸载可选组件
  * 可以通过跳板机访问集群节点
  * 支持集群组件版本查询的操作
  * 支持集群升级操作
* coredns 应该分发到 k8s_cluster
* amd64 适配操作系统
  * OpenEuler 20.03
* arm64 适配操作系统
  * Ubuntu 20.04

## spray-v2.18.0a-0_k8s-v1.23.3_v1.5

**发布时间**

2021-01-26

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

## spray-v2.18.0-5_k8s-v1.23.1_v1.4

**前提条件**

* kuboard-spray 版本不低于 v1.0.0-alpha.5

**更新内容**

* 配合 kuboard-spray v1.0.0-alpha.5 及以上版本
  * 可以单独安装可选组件
* 优化
  * 更新 /etc/nginx/nginx.conf 后，检查 nginx 的重启状态
  * 更新 /etc/kubernetes/manifests/kube-apiserver.yaml 中 etcd-server 参数后，检查所有 apiserver 的重启状态
* 问题修正
  * 添加工作节点时，因为缺少 kube-proxy 镜像导致新增的节点不能正常工作的问题
  * 不能正常设置 nginx 参数的问题
  * coredns 最小副本书设定的问题