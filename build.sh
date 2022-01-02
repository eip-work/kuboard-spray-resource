#!/bin/bash

# tag=swr.cn-east-2.myhuaweicloud.com/kuboard/kuboard-spray-resource
tag=registry.cn-shanghai.aliyuncs.com/kuboard-spray/kuboard-spray-resource
tag_backup=eipwork/kuboard-spray-resource

version=$(cat package.yaml | shyaml get-value metadata.version)
kuboardspray_version="${version#*spray-}"
kuboardspray_version="${kuboardspray_version%%_k8s*}"


echo "checkout eip-work/kubespray:${kuboardspray_version}"

cd ./3rd/kubespray
git checkout ${kuboardspray_version}
git pull

cd ../..

echo
echo "checkout eip-work/kuboard-spray-resource:${version}"
git checkout ${version}
git pull

rm kubespray_cache
ln -s "/root/kuboard-spray-resource-cache/${version}" kubespray_cache

docker build -f Dockerfile -t $tag:$version .


docker push $tag:$version

docker tag $tag:$version $tag_backup:$version

docker push $tag_backup:$version
