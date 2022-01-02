#!/bin/bash

# tag=swr.cn-east-2.myhuaweicloud.com/kuboard/kuboard-spray-resource
tag=$(cat package.yaml | shyaml get-value metadata.available_at.0)

version=$(cat package.yaml | shyaml get-value metadata.version)
kuboardspray_version="${version#*spray-}"
kuboardspray_version="${kuboardspray_version%%_k8s*}"


echo "checkout eip-work/kubespray:${kuboardspray_version}"

cd ./3rd/kubespray
git checkout ${kuboardspray_version}
git pull

cd ../..

# echo
# echo "checkout eip-work/kuboard-spray-resource:${version}"
# git checkout ${version}
# git pull

echo
echo "链接到 /cache/${version}"

# 挪一下文件位置，以便将目录映射到镜像不同的 layer
rm kubespray_cache
mkdir image_cache_k8s
mv ./cache/${version}/images/k8s.* image_cache_k8s/
mv ./cache/${version}/images image_cache
mv ./cache/${version} kubespray_cache


echo
echo "构建镜像"

docker build -f Dockerfile -t $tag:$version .

# 将文件恢复到原来的位置
mv kubespray_cache ./cache/${version}
mv image_cache ./cache/${version}/images
mv image_cache_k8s/k8s.* ./cache/${version}/images/
rm -r image_cache_k8s

ln -s "./cache/${version}" kubespray_cache
ls -lh kubespray_cache

echo
echo "推送镜像"
docker push $tag:$version

available_at_length=$(cat package.yaml | shyaml get-length metadata.available_at)

echo $available_at_length
for ((i = 1; i < ${available_at_length}; i++)) do
  tag_backup=$(cat package.yaml | shyaml get-value metadata.available_at.${i})
  echo ""
  echo "推送镜像 ${tag_backup}"
  docker tag $tag:$version $tag_backup:$version
  docker push $tag_backup:$version
done

