FROM alpine:3.15.0

COPY kubespray_cache/  /kuboard-spray/resource/content/kubespray_cache/
COPY image_cache_k8s/ /kuboard-spray/resource/content/kubespray_cache/images/
COPY image_cache/ /kuboard-spray/resource/content/kubespray_cache/images/
COPY image_cache_kuboard/ /kuboard-spray/resource/content/kubespray_cache/images/
COPY 3rd/ /kuboard-spray/resource/content/3rd/
COPY roles/ /kuboard-spray/resource/content/roles/
COPY action_plugins/ /kuboard-spray/resource/content/action_plugins/
COPY callback_plugins/ /kuboard-spray/resource/content/callback_plugins/
COPY ansible.cfg README.md release.md *.yaml *.md /kuboard-spray/resource/content/