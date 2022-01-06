# !/bin/bash
echo '开始启动mysql'
docker run -d --name some-mysql  -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456  mysql
echo '启动完成'

