#!/bin/bash
echo 删除已有 link
rm kubespray_cache

version=$(cat package.yaml | shyaml get-value metadata.version)
kubespray_version="${version#*spray-}"
kubespray_version="${kubespray_version%%_k8s*}"


echo "checkout eip-work/kubespray:${kubespray_version}"

cd ./3rd/kubespray
git pull
git checkout ${kubespray_version}

cd ../..

echo
echo "链接到 /cache/${version}"
mkdir "./cache/${version}" || true
ln -s "./cache/${version}" kubespray_cache

echo

ls -lh kubespray_cache
