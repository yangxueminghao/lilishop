# !/bin/bash
echo '开始启动mysql'
docker run -d --name mysql-master  -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456  mysql --character-set-server=utf8mb4 --collation-server=utf8mb4_general_ci --server-id=201 --log-bin=mysql-master-bin --relay_log=ep-mysql-relay-bin --read_only=1
echo '启动完成'

