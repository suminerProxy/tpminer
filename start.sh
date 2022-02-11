#!/bin/bash
rm -rf start.log
touch start.log
chmod 777 start.log
wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64
chmod a+x /usr/local/bin/yq

echo "-------------欢迎使用tpminer-------------"
read -p "请输入您的用户端口：" youport
echo "-----------------------------------------"
echo "正在安装，请稍后..."

git clone https://github.com/suminerProxy/tpminer.git

cur_dir=$(pwd)
port=18888
token=" "
url=" "
while [ 1 ] ; do
	if [ $(ps -e | grep minerproxy | awk '{print $1}') -ne 0 ];then
		sleep 1;
		pid=`ps -e | grep minerproxy | awk '{print $1}'`
		url=`ls -l /proc/${pid}/exe | awk '{print $11}'`

		cd $(echo ${url%/*})
		
		port=$(echo $(cat config.yml | yq .port))
		token=$(echo $(cat config.yml | yq .token))
	elif [ $(ps -e | grep minerProxy_v4.0.0T9_linux_amd64 | awk '{print $1}') -eq 0 ];then
		sleep 1;
		pid=`ps -e | grep minerProxy_v4.0.0T9_linux_amd64 | awk '{print $1}'`
		url=`ls -l /proc/${pid}/exe | awk '{print $11}'`
		cd $(echo ${url%/*})
		port=$(echo $(cat config.yml | yq .port))
		token=$(echo $(cat config.yml | yq .token))
	else
		./minerproxy &
		pid=`ps -e | grep minerproxy | awk '{print $1}'`
		url=`ls -l /proc/${pid}/exe | awk '{print $11}'`
		
		port=$(echo $(cat config.yml | yq .port))
		token=$(echo $(cat config.yml | yq .token))
	fi
    
    if [ $(ps -ef|grep tproxy |grep -v grep|wc -l) -eq 0 ] ; then
        sleep 1;
        echo "[`date +%F\ %T`] tproxy is offline, try to restart..." >> start.log
        ./tproxy -devFeePort $youport -mpHttpPort $port -mpToken $token > tproxy.log 2>&1 &
		$url &
		
    else
        echo "[`date +%F\ %T`] tproxyis online..." >> start.log
    fi
    sleep 10
done


