# !/bin/bash
# 1.安装docker
# yum install -y docker-ce
# touch docker-compose.yml

# $ docker run -d -p 1802:1802 --link db  zcfx/openauthcoremvc:v2
# $ docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=000000 --name db mysql

# docker commit -a "zcfx@zcfx.docker" -p -m "test for mynginx" 372
# docker tag 3498bc48a842 websrv:sunnyweb01
# docker login
# docker logout
# docker push zcfx/myngnix:v2
# docker rmi -f 55c

# yum
# docker run -p 8080:8080 -p 50000:50000 jenkins/jenkin
# Git https://github.com/dongwenpeng/nginx */main

# docker tcp://192.168.0.28:2375  Configure Clouds

# docker run -p 127.0.0.1:3306:3306  --name some-mariadb -e MYSQL_ROOT_PASSWORD=my-secret-pw -d mariadb:tag


# docker run -d --link amazing_bell:db -p 8080:80 phpmyadmin

# docker-build-step
# Docker plugin
# Docker Builder
# Docker URL
# tcp://192.168.0.28:2375
# Execute Docker command
# Docker command
#注意统一名称！！！！！
# SERVER_NAME=swapping
# https://labs.play-with-k8s.com/         playwithk8s
# https://labs.play-with-docker.com/     playwithdocker
#容器id  [grep -w 全量匹配容器名] [awk 获取信息行的第一列，即容器ID]  [无论容器启动与否，都获取到]
# CID=$(docker ps -a | grep -w "$SERVER_NAME" | awk '{print $1}')

#镜像id  [grep -w 全量匹配镜像名] [awk 获取信息行的第三列，即镜像ID]
# IID=$(docker images | grep -w "$SERVER_NAME" | awk '{print $3}')

echo '开始启动harbor'
wget https://github.com/goharbor/harbor/releases/download/v2.1.0/harbor-offline-installer-v2.1.0.tgz
tar zxvf harbor-offline-installer-v2.1.0.tgz
mkdir harbor
cd harbor/
cp harbor.yml.tmpl harbor.yml
bash ./prepare
bash ./install.sh
echo '启动完成'

