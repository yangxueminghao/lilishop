# !/bin/bash
echo '开始启动treesoft'
docker run -d --name clientweb -p 18080:8080 lu566/treesoft:1.0
#/treedms 默认用户名及密码 admin treesoft
#/treenms 默认用户名及密码 admin treesoft
echo '启动完成'

