# !/bin/bash
echo '开始启动redis'
#docker run -d -v /myredis/conf:/usr/local/etc/redis --name myredis redis
docker run -d -p 6379:6379 --name myredis redis
docker run -d -p 6380:6379 --name myredis2 redis
echo '启动完成'

