# !/bin/bash
echo '开始启动gitlab'
docker run -d -p 443:443 -p 80:80 -p 222:22 --name gitlab -v /home/gitlab/config:/etc/gitlab -v /home/gitlab/logs:/var/log/gitlab -v /home/gitlab/data:/var/opt/gitlab gitlab/gitlab-ce
echo '启动完成'

