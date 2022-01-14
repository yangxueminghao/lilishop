# !/bin/bash
echo '开始启动navicat'
docker run -p 3000:3000 -d navicat/navicatmonitor:2.6.0
echo '启动完成'

