# !/bin/bash
echo '开始启动jenkins'
# docker tcp://192.168.0.28:2375
mkdir /home/jenkins_home
chmod 777 -R /home/jenkins_home
docker run -d -p 8080:8080 -p 50000:50000 -v /home/jenkins_home:/var/jenkins_home jenkins/jenkins

echo '启动完成'

