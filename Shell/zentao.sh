# !/bin/bash
echo '开始启动zentao'
docker run --name zentao -p 8868:80 -p 3306:3303 -v /workspace/zentao:/app/zentaopms -v /workspace/zentao:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -d 766b2eda1768
echo '启动完成'

