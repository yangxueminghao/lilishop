# !/bin/bash
echo '开始启动jenkins'
docker run -p 8080:8080 -p 50000:50000 -v /your/home:/var/jenkins_home jenkins
echo '启动完成'

