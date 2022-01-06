# !/bin/bash
echo '开始启动elasticsearch'
docker network create somenetwork
docker run -d --name elasticsearch --net somenetwork -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" elasticsearch:7.16.2
echo '启动完成'

