# !/bin/bash
echo '开始启动nginx'
#docker run --name my-nginx -p 8080:80 -v ${pwd}/nginx:/etc/nginx -d nginx
docker run --name my-nginx -p 8080:8080 -p 3308:3308 -d nginx
echo '启动完成'

