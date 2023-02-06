#!/bin/bash

#install base
rpm -q curl || yum install -y curl
rpm -q wget || yum install -y wget
apt-get install git -y || yum install git -y

#check docker
docker version > /dev/null || curl -fsSL get.docker.com | bash
service docker restart
systemctl start docker
systemctl enable docker

#config
read -p "Please Input Node_ID：" id
apikey=fab93f2c5962143c3
apihost=https://vturay.com/

#docker_run
docker run --restart=always --name v${id}  -d -v /etc/soga/:/etc/soga/ --network host v2raysrgo/crack-soga \
--type=sspanel-uim \
--server_type=v2ray \
--api=webapi \
--webapi_url=${apihost} \
--webapi_mukey=${apikey} \
--soga_key=mgwx \
--node_id=${id}
docker ps -a
echo -e "\033[32m 安装完成 \033[0m"
