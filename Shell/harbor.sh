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

# 生成CA证书私钥
# openssl genrsa -out ca.key 4096
# 生成CA证书
# openssl req -sha512 -new \
#     -subj "/C=CN/ST=Beijing/L=Beijing/O=example/OU=Personal/CN=192.168.159.132" \
#     -key 192.168.159.132.key \
#     -out 192.168.159.132.csr
# 生成服务器私钥
# openssl genrsa -out 192.168.159.132.key 4096
# 生成服务端CA证书
# openssl req -x509 -new -nodes -sha512 -days 3650 \
#  -subj "/C=CN/ST=Beijing/L=Beijing/O=example/OU=Personal/CN=192.168.159.132" \
#  -key ca.key \
#  -out ca.crt
# 生成x509 v3 扩展文件
# cat > v3.ext <<-EOF
# authorityKeyIdentifier=keyid,issuer
# basicConstraints=CA:FALSE
# keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
# extendedKeyUsage = serverAuth
# subjectAltName = IP:192.168.159.132
# EOF
# 生成主机证书
# openssl x509 -req -sha512 -days 3650 \
#     -extfile v3.ext \
#     -CA ca.crt -CAkey ca.key -CAcreateserial \
#     -in 192.168.159.132.csr \
#     -out 192.168.159.132.crt
# 复制服务端证书文件到认证目录
# mkdir -p /data/cert/
# cp 192.168.159.132.crt /data/cert/
# cp 192.168.159.132.key /data/cert/
# 增加docker证书可信
# openssl x509 -inform PEM -in 192.168.159.132.crt -out 192.168.159.132.cert
# cp 192.168.159.132.cert /etc/docker/certs.d/192.168.159.132/
# cp 192.168.159.132.key /etc/docker/certs.d/192.168.159.132/
# cp ca.crt /etc/docker/certs.d/192.168.159.132/

echo '开始启动harbor'
cd /home
# mkdir harbor-keys
# cd harbor-keys
# openssl genrsa -out rsa_private.key 2048
# 这一步需要填一些东西，记得别填密码，另外 Common Name 填域名或者host里对应当前ip的值(如：master)
# openssl req -new -key rsa_private.key -out rsa_private.csr
# openssl x509 -req -days 365 -in rsa_private.csr -signkey rsa_private.key -out rsa_private.crt
# cd ..
wget https://github.com/goharbor/harbor/releases/download/v2.1.0/harbor-offline-installer-v2.1.0.tgz
tar zxvf harbor-offline-installer-v2.1.0.tgz
mkdir harbor
cd harbor/
cp harbor.yml.tmpl harbor.yml
# 可以先注釋調https
vim harbor.yml
    hostname: 192.168.0.28
    https:
      port: 443
      certificate: /home/harbor-keys/rsa_private.crt
      private_key: /home/harbor-keys/rsa_private.key
bash ./prepare
bash ./install.sh
echo '启动完成'

