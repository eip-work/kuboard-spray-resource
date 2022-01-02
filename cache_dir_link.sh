#!/bin/bash
echo 删除已有 link
rm kubespray_cache

version=$(cat package.yaml | shyaml get-value metadata.version)

echo
echo "链接到 /cache/${version}"
mkdir "./cache/${version}" || true
ln -s "./cache/${version}" kubespray_cache

echo

ls -lh kubespray_cache
