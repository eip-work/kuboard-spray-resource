# kuboard-spray-resource-package

将 kuboard spray 所需的资源包打包成一个镜像供用户下载


- name: Shutdown firewalld
  import_playbook: contrib/os-services/os-services.yml