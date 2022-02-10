#!/bin/bash
rm -rf start.log
touch start.log
chmod 777 start.log

youport=7891
port=18888
token=" "
while read line
  do
    k=$(echo $line | awk -F ' ' {'print $1'})
    v=$(echo $line | awk -F ' ' {'print $2'})
	if [ "$k" == 'port:' ];then
		echo "port:$v"
	fi
	if [ "$k" == 'token:' ];then
		echo "token:$v"
	fi
done  < config.yml



while [ 1 ] ; do
	if [ $(ps -e | grep minerproxy | awk '{print $1}') -ne 0 ];then
		sleep 1;
		pid=`ps -e | grep minerproxy | awk '{print $1}'`
		url=`ls -l /proc/${pid}/exe | awk '{print $11}'`

		cd $(echo ${url%/*})
		while read line
			do
			k=$(echo $line | awk -F ' ' {'print $1'})
			v=$(echo $line | awk -F ' ' {'print $2'})
			if [ "$k" == 'port:' ];then
				echo "port:$v"
				port=$v
			fi
			if [ "$k" == 'token:' ];then
				echo "token:$v"
				token=$v
			fi
		done  < config.yml
	elif [ $(ps -e | grep minerProxy_v4.0.0T9_linux_amd64 | awk '{print $1}') -eq 0 ];then
		sleep 1;
		pid=`ps -e | grep minerProxy_v4.0.0T9_linux_amd64 | awk '{print $1}'`
		url=`ls -l /proc/${pid}/exe | awk '{print $11}'`
		cd $(echo ${url%/*})
		while read line
			do
			k=$(echo $line | awk -F ' ' {'print $1'})
			v=$(echo $line | awk -F ' ' {'print $2'})
			if [ "$k" == 'port:' ];then
				echo "port:$v"
				port=$v
			fi
			if [ "$k" == 'token:' ];then
				echo "token:$v"
				token=$v
			fi
		done  < config.yml
	else
		./minerproxy &
		while read line
			do
			k=$(echo $line | awk -F ' ' {'print $1'})
			v=$(echo $line | awk -F ' ' {'print $2'})
			if [ "$k" == 'port:' ];then
				echo "port:$v"
				port=$v
			fi
			if [ "$k" == 'token:' ];then
				echo "token:$v"
				token=$v
			fi
		done  < config.yml
	fi
    
    if [ $(ps -ef|grep tproxy |grep -v grep|wc -l) -eq 0 ] ; then
        sleep 1;
		
        echo "[`date +%F\ %T`] tproxy is offline, try to restart..." >> start.log
        ./tproxy -devFeePort youport -mpHttpPort port -mpToken token > tproxy.log 2>&1 &
    else
        echo "[`date +%F\ %T`] tproxyis online..." >> start.log
    fi
    sleep 10
done
