调整控制节点的顺序：
  1. 在 inventory 中调整控制节点的顺序
  2. upgrade-cluster.yml 或者 cluster.yml

添加工作节点：
  1. add node to inventory
  2. all: facts.yml
     target_node: scale.yml

删除工作节点：
  1. target_node: remove-node.yml
  2. delete node from inventory

添加删除控制节点：
  1. add node to inventory
  2. all: cluster.yml
  3. all: restart nginx-proxy pod.
      需要验证，使用 containerd 部署的集群里，是如何启动 nginx-proxy 的
        ```sh
        docker ps | grep k8s_nginx-proxy_nginx-proxy | awk '{print $1}' | xargs docker restart
        ```
  4. delete node from inventory


替换第一个控制节点
  1. 调整 inventory 中控制节点的顺序
  2. remove-node.yml 删除原第一个控制节点
  3. kubectl edit cm -n kube-public cluster-info
  4. 添加新的控制节点到 inventory
  5. cluster.yml --limit=kube_control_plane


# 资源包的基本测试案例：

## 安装集群

* 安装单节点集群
* 安装三主节点集群

## 添加、删除节点：

1. 向集群中添加2个工作节点
2. 向集群中添加2个控制节点（含ETCD）1个工作节点
    2.1. 验证所有控制节点的 /etc/kubernetes/manifests/apiserver.yaml 中已经添加了新 ETCD 的地址
    2.2. 验证所有工作节点的 /etc/nginx/nginx.conf 文件中已经添加了新的 apiserver 地址到 local-loadbalance-proxy
3. 从集群中删除2个工作节点（1个在线、1个离线）
4. 从集群中删除1个控制节点（含ETCD）在线节点
    4.1. 验证所有控制节点的 /etc/kubernetes/manifests/apiserver.yaml 中已经删除了该 ETCD 的地址
    4.2. 验证所有工作节点的 /etc/nginx/nginx.conf 文件中已经删除了该 apiserver 地址
5. 从集群中删除1个控制节点（含ETCD）离线节点
    5.1. 验证所有控制节点的 /etc/kubernetes/manifests/apiserver.yaml 中已经删除了该 ETCD 的地址
    5.2. 验证所有工作节点的 /etc/nginx/nginx.conf 文件中已经删除了该 apiserver 地址
6. 从集群中删除1个控制节点（含ETCD）1个工作节点，在线节点
    6.1. 验证所有控制节点的 /etc/kubernetes/manifests/apiserver.yaml 中已经删除了该 ETCD 的地址
    6.2. 验证所有工作节点的 /etc/nginx/nginx.conf 文件中已经删除了该 apiserver 地址
7. 从集群中删除1个控制节点（含ETCD）1个工作节点，离线节点
    7.1. 验证所有控制节点的 /etc/kubernetes/manifests/apiserver.yaml 中已经删除了该 ETCD 的地址
    7.2. 验证所有工作节点的 /etc/nginx/nginx.conf 文件中已经删除了该 apiserver 地址

测试矩阵

