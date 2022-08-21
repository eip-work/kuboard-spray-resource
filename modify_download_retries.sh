#!/bin/bash
sed -i 's/retries: 4/retries: 0/g' ./3rd/kubespray/roles/download/tasks/download_container.yml
sed -i 's/retries: 4/retries: 0/g' ./3rd/kubespray/roles/download/tasks/download_file.yml