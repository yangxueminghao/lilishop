# !/bin/bash
# 1.安装docker
# yum install -y docker-ce
echo '开始启动harbor'
wget https://github.com/goharbor/harbor/releases/download/v2.1.0/harbor-offline-installer-v2.1.0.tgz
tar zxvf harbor-offline-installer-v2.1.0.tgz
mkdir harbor
cd harbor/
cp harbor.yml.tmpl harbor.yml
bash ./prepare
bash ./install.sh
echo '启动完成'

