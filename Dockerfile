FROM alpine:3.15.0

COPY 3rd/ /kuboard-spray/resource/content/3rd/
COPY roles/ /kuboard-spray/resource/content/roles/
COPY kubespray_cache/  /kuboard-spray/resource/content/kubespray_cache/
COPY image_cache_k8s/ /kuboard-spray/resource/content/kubespray_cache/images/
COPY image_cache/ /kuboard-spray/resource/content/kubespray_cache/images/
COPY ansible.cfg README.md release.md *.yaml *.md /kuboard-spray/resource/content/