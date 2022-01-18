# !/bin/bash
echo '开始启动sonarqube'
#curl -sSL https://raw.githubusercontent.com/bitnami/bitnami-docker-sonarqube/master/docker-compose.yml > docker-compose.yml
#docker-compose up -d
docker run -d --name sonarqube --privileged=true     -p 9000:9000  -v ${PWD}/logs:/opt/sonarqube/logs   sonarqube:9.1.0-community
#admin/admin
echo '启动完成'

