# !/bin/bash
echo '开始启动mysql'
docker pull docker.io/percona/percona-xtradb-cluster:5.7.21
docker tag docker.io/percona/percona-xtradb-cluster:5.7.21 pxc
docker network create --subnet=172.18.0.0/24   net1
docker volume create v1
docker volume create v2
docker volume create v3
docker run -d -p 3307:3306 -v v1:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -e CLUSTER_NAME=PXC -e XTRABACKUP_PASSWORD=123456 --privileged --name=node1 --net=net1 --ip 172.18.0.2 pxc
# docker run -d --name some-mysql  -p 3306:3306 -e MYSQL_ROOT_PASSWORD=123456  mysql
#create user 'xtrabackup'@'%' identified by '123456';
#grant all privileges on *.* to 'xtrabackup'@'%' with grant option ;

echo '启动完成'

#docker run -d -p 3308:3306 -v v2:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456 -e CLUSTER_NAME=PXC -e XTRABACKUP_PASSWORD=123456 -e CLUSTER_JOIN=node1 --privileged --name=node2 --net=net1 --ip 172.18.0.3 pxc
#GRANT ALL PRIVILEGES ON *.* TO 'xtrabackup'@'%' IDENTIFIED BY '123456' WITH GRANT OPTION;
#flush privileges;
#docker run -d -p 3309:3306 -v v3:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=123456  -e CLUSTER_NAME=PXC -e XTRABACKUP_PASSWORD=123456 -e CLUSTER_JOIN=node1 --privileged --name=node3 --net=net1 --ip 172.18.0.4 pxc
