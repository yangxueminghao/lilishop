# !/bin/bash
echo '开始启动phpmyadmin'
docker run --name myadmin -d -e PMA_HOST=192.168.0.13 -e PMA_PORT=3307  -p 8080:80 phpmyadmin
docker run --name myadmin2 -d -e PMA_HOST=192.168.0.13 -e PMA_PORT=3308  -p 8081:80 phpmyadmin
echo '启动完成'

