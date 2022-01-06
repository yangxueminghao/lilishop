# !/bin/bash
echo '开始启动baget'
docker run -d --name BaGet-nuget -p 9002:80 -v $(pwd)/baget-data:/var/baget loicsharma/baget:latest
echo '启动完成'

