# !/bin/bash
echo '开始启动mailserver'
wget https://raw.githubusercontent.com/tomav/docker-mailserver/master/setup.sh
wget https://raw.githubusercontent.com/tomav/docker-mailserver/master/docker-compose.yml
wget https://raw.githubusercontent.com/tomav/docker-mailserver/master/mailserver.env
wget -O .env https://raw.githubusercontent.com/tomav/docker-mailserver/master/compose.env

chmod a+x ./setup.sh
./setup.sh
docker-compose up -d mailserver

./setup.sh -Z email add user@domain password
./setup.sh -Z alias add postmaster@domain user@domain
./setup.sh -Z config dkim
echo '启动完成'

