# !/bin/bash
echo '开始启动jenkins'
# docker tcp://192.168.0.28:2375
#容器id  [grep -w 全量匹配容器名] [awk 获取信息行的第一列，即容器ID]  [无论容器启动与否，都获取到]
#CID=$(docker ps -a | grep -w "$SERVER_NAME" | awk '{print $1}')

#镜像id  [grep -w 全量匹配镜像名] [awk 获取信息行的第三列，即镜像ID]
#IID=$(docker images | grep -w "$SERVER_NAME" | awk '{print $3}') openauth:${BUILD_NUMBER}
#1 Build / Publish Docker Image
#1
# Directory for Dockerfile .
# Cloud dockerserver
# image zcfx/openauth:${BUILD_NUMBER}
# push zcfx/openauth:${BUILD_NUMBER} dockerhub username password
#2 Action to choose zcfx/openauth:${BUILD_NUMBER}
#2 Start/Stop Docker Containers
#2 Action to choose zcfx/openauth:${BUILD_NUMBER}

mkdir /home/jenkins_home
chmod 777 -R /home/jenkins_home
docker run -d -p 8080:8080 -p 50000:50000 -v /home/jenkins_home:/var/jenkins_home jenkins/jenkins

echo '启动完成'

