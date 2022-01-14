# !/bin/bash
echo '开始启动mysql'
#docker run -d --name some-mysql  -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456  mysql
#docker run -d --name some-mysql2  -p 3307:3306 -e MYSQL_ROOT_PASSWORD=123456  mysql
docker run -d --name some-mysql  -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456  mysql:5.6
docker run -d --name some-mysql2  -p 3307:3306 -e MYSQL_ROOT_PASSWORD=123456  mysql:5.6
echo '启动完成'

