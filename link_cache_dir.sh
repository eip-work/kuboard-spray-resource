#!/bin/bash

version=$(cat package.yaml | shyaml get-value metadata.version)
kubespray_version="${version#*spray-}"
kubespray_version="${kubespray_version%%_k8s*}"

echo
echo 删除 package.yaml
rm package.yaml
if [ $(uname -m) == "x86_64" ]; then
  ln -s "package_amd64.yaml" package.yaml
else
  ln -s "package_arm64.yaml" package.yaml
fi

if [ "${1}x" == "x" ]; then

  echo "checkout eip-work/kubespray:${kubespray_version}"
  cd ./3rd/kubespray
  git pull
  git checkout ${kubespray_version}

  cd ../..
fi

echo 删除已有 link
rm kubespray_cache

echo
echo "链接到 /cache/${version}"
mkdir "./cache/${version}" || true
ln -s "./cache/${version}" kubespray_cache

echo

ls -lh kubespray_cache
