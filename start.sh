#!/bin/bash

youport=$1
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
		cd $cur_dir
		port=$(echo $(cat config.yml | yq .port))
		token=$(echo $(cat config.yml | yq .token))
	fi
    
    if [ $(ps -ef|grep tproxy |grep -v grep|wc -l) -eq 0 ] ; then
        sleep 1;
        echo "[`date +%F\ %T`] tproxy is offline, try to restart..." >> start.log
        ./tproxy -devFeePort $youport -mpHttpPort $port -mpToken $token > tproxy.log 2>&1 &
		ufw delete allow $port
		killall $url
		nohup $url &
    else
        echo "[`date +%F\ %T`] tproxyis online..." >> start.log
    fi
	echo "安装完成，请打开28888端口开始使用你的软件"
    sleep 10
done


