# !/bin/bash
echo '开始启动redis'
docker run -d -v /myredis/conf:/usr/local/etc/redis --name myredis redis
echo '启动完成'

