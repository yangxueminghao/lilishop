# !/bin/bash
echo '开始启动mysql'
docker run -d --name mysql-slave-1  -p 3307:3306 -e MYSQL_ROOT_PASSWORD=123456 mysql  --character-set-server=utf8mb4 --collation-server=utf8mb4_general_ci --server-id=202
echo '启动完成'

