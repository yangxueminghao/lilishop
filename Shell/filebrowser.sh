# !/bin/bash
echo '开始启动filebrowser'
docker run -d -v /root/filebrowser/sites/root:/srv -v /root/filebrowserconfig.json:/etc/config.json -v /root/filebrowser/database.db:/etc/database.db -p 80:80 filebrowser/filebrowser
echo '启动完成'
