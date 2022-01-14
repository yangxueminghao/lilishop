# !/bin/bash
echo '开始启动rediscluster'
docker create --name redis-node1 --net host -v /data/redis-data/node1:/data redis:5.0.5 --cluster-enabled yes --cluster-config-file nodes-node-1.conf --port 6379
docker create --name redis-node2 --net host -v /data/redis-data/node2:/data redis:5.0.5 --cluster-enabled yes --cluster-config-file nodes-node-2.conf --port 6380
docker create --name redis-node3 --net host -v /data/redis-data/node3:/data redis:5.0.5 --cluster-enabled yes --cluster-config-file nodes-node-3.conf --port 6381
docker create --name redis-node4 --net host -v /data/redis-data/node4:/data redis:5.0.5 --cluster-enabled yes --cluster-config-file nodes-node-4.conf --port 6382
docker create --name redis-node5 --net host -v /data/redis-data/node5:/data redis:5.0.5 --cluster-enabled yes --cluster-config-file nodes-node-5.conf --port 6383
docker create --name redis-node6 --net host -v /data/redis-data/node6:/data redis:5.0.5 --cluster-enabled yes --cluster-config-file nodes-node-6.conf --port 6384
docker start redis-node1 redis-node2 redis-node3 redis-node4 redis-node5 redis-node6
docker exec -it redis-node1 /bin/bash
#redis-cli --cluster create  192.168.0.28:6379  192.168.0.28:6380  192.168.0.28:6381  192.168.0.28:6382  192.168.0.28:6383  192.168.0.28:6384 --cluster-replicas 1
#root@node1:/data# redis-cli -c -h 192.168.0.28 -p 6379
echo '启动完成'

