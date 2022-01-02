FROM alpine:3.15.0

ADD ./3rd /kuboard-spray/resource/content/3rd
ADD ./roles /kuboard-spray/resource/content/roles
ADD ./ansible.cfg ./README.md ./package.yaml /kuboard-spray/resource/content/
ADD ./kubespray_cache/ /kuboard-spray/resource/content/kubespray_cache/
