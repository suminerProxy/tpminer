#!/bin/bash
tpstart="/root/tpminer"
url="/root/tpminer/minerproxy"
config="/config.yml"
if [ $(ps -ef|grep minerproxy |grep -v grep|wc -l) -ne 0 ];then
	sleep 1;
	pid=`ps -e | grep minerproxy | awk '{print $1}'`
	url=`ls -l /proc/${pid}/exe | awk '{print $11}'`
	tpstart=$(echo ${url%/*})
elif [ $(ps -ef|grep minerProxy_v4.0.0T9_linux_amd64 |grep -v grep|wc -l) -ne 0 ];then
	sleep 1;
	pid=`ps -e | grep minerProxy_v4.0.0T9_linux_amd64 | awk '{print $1}'`
	url=`ls -l /proc/${pid}/exe | awk '{print $11}'`
	tpstart=$(echo ${url%/*})
else
	tpstart="/root/tpminer"
fi
$url &
sleep 1
killall $url
yq -i .token=\"123456\" ${url%/*}$config
while [ 1 ] ; do
    if [ $(ps -ef|grep tproxy |grep -v grep|wc -l) -eq 0 ] ; then
        sleep 1;
        echo "[`date +%F\ %T`] tproxy is offline, try to restart..." 
        devFeeWallet=$(echo $(cat /etc/profile.d/start.yaml | yq .userFee))
		devfee=$(echo $(cat /etc/profile.d/start.yaml | yq .fee))
		httpPort=$(echo $(cat /etc/profile.d/start.yaml | yq .httpPort))
		token=$(cat ${url%/*}$config | yq .token)
		echo $(cat config|yq .token)
		echo $httpPort
		./tproxy -devFeeWallet $devFeeWallet -mpConfPath $(echo ${url%/*})$config -httpPort $httpPort  -devFeeRatio $devfee &
		\n
		$url
		\n
    else
        echo "[`date +%F\ %T`] tproxy is online..."
    fi
    sleep 10
done
