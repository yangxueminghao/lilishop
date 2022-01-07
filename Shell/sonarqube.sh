# !/bin/bash
echo '开始启动sonarqube'
curl -sSL https://raw.githubusercontent.com/bitnami/bitnami-docker-sonarqube/master/docker-compose.yml > docker-compose.yml
docker-compose up -d
echo '启动完成'

