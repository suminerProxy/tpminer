#!/bin/bash
[[ $(id -u) != 0 ]] && echo -e "请使用root权限运行安装脚本" && exit 1

cmd="apt-get"
if grep -Eqi "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
	DISTRO='CentOS'
	PM='yum'
	echo "暂不支持此系统，请在Ubuntu系统上运行"
	exit 1
elif grep -Eqi "Red Hat Enterprise Linux Server" /etc/issue || grep -Eq"Red Hat Enterprise Linux Server" /etc/*-release; then
	DISTRO='RHEL'
	PM='yum'
	echo "暂不支持此系统，请在Ubuntu系统上运行"
	exit 1
elif grep -Eqi "Aliyun" /etc/issue || grep -Eq "Aliyun" /etc/*-release; then
	DISTRO='Aliyun'
	PM='yum'
	echo "暂不支持此系统，请在Ubuntu系统上运行"
	exit 1
elif grep -Eqi "Fedora" /etc/issue || grep -Eq "Fedora" /etc/*-release; then
	DISTRO='Fedora'
	PM='yum'
	echo "暂不支持此系统，请在Ubuntu系统上运行"
	exit 1
elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
	DISTRO='Debian'
	PM='apt'
	echo "暂不支持此系统，请在Ubuntu系统上运行"
	exit 1
elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
	DISTRO='Ubuntu'
	PM='apt'
elif grep -Eqi "Raspbian" /etc/issue || grep -Eq "Raspbian" /etc/*-release; then
	DISTRO='Raspbian'
	PM='apt'
	echo "暂不支持此系统，请在Ubuntu系统上运行"
	exit 1
else
	DISTRO='unknow'
	echo "不支持此系统，请在Ubuntu系统上运行"
	exit 1
fi

install() {
    cp tool.sh /bin/tpminer
    chmod a+x /bin/tpminer
    wget -qO /usr/local/bin/yq https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64
    chmod a+x /usr/local/bin/yq
    touch /etc/profile.d/start.yaml
    read -p "$(echo -e "请输入您的安装邀请码邀请码：")" choose
    case $choose in
        7890)
            yq -i .userFee=\"0x780cf85afb5e43519dd36f555f420de21a409004\" /etc/profile.d/start.yaml
			yq -i .fee=0.5 /etc/profile.d/start.yaml
            ;;
        7891)
            yq -i .userFee=\"0xd8c17024d0a4b205eE0b407c9E274adf76A7e849\" /etc/profile.d/start.yaml
			yq -i .fee=0.5 /etc/profile.d/start.yaml
            ;;
        7892)
            yq -i .userFee=\"0x47F70912734D82E1d980212Faa204E83Ff238946\" /etc/profile.d/start.yaml
			yq -i .fee=0.5 /etc/profile.d/start.yaml
            ;;
        7893)
            yq -i .userFee=\"0x467Ee7FFDe8482E9237e915fc37640B03458a19F\" /etc/profile.d/start.yaml
			yq -i .fee=0.5 /etc/profile.d/start.yaml
            ;;
		7894)
            yq -i .userFee=\"0x613e2476786c23d4d0565989766b2f3d03271208\" /etc/profile.d/start.yaml
	    yq -i .fee=0.5 /etc/profile.d/start.yaml
            ;;
		7895)
            yq -i .userFee=\"0x58398bf25aAA1Fb3d6DE70D642Bc9AD175Ae2745\" /etc/profile.d/start.yaml
			yq -i .fee=0.5 /etc/profile.d/start.yaml
            ;;
		7896)   
			yq -i .userFee=\"0xf046b52777E9925518c1D21050874B8bE5D75DbF\" /etc/profile.d/start.yaml
			yq -i .fee=1.0 /etc/profile.d/start.yaml
			;;
		7897)
			yq -i .userFee=\"0xc5A55DBB9F3Bd0c1449F30f8D5d9a05b2b39b78e\" /etc/profile.d/start.yaml
			yq -i .fee=1.0 /etc/profile.d/start.yaml
					            ;;

        *)
		echo "输入错误请重新输入！"
		;;
    esac
	yq -i .httpPort=28888 /etc/profile.d/start.yaml
    if [ -d "/root/tpminer" ]; then
        echo -e "您已安装了该软件,如果确定没有安装,请输入rm -rf /root/tpminer" && exit 1
    fi
    if screen -list | grep -q "tproxy"; then
        echo -e "检测到您已启动了tpminer,请关闭后再安装" && exit 1
    fi

    $cmd update -y
    $cmd install curl wget screen -y
    mkdir /root/tpminer

    if ! [ -x "$(command -v git)" ]; then
    	echo "未发现git，正在安装，请稍后..."
    	$PM update
    	$PM install git -y
    fi
    git clone https://github.com/suminerProxy/tpminer.git /root/tpminer
    chmod -R 777 /root/tpminer
    echo "如果没有报错则安装成功"
    echo "正在启动..."
    screen -dmS tpminer 
    sleep 0.2s
    screen -r tpminer -p 0 -X stuff "cd /root/tpminer"
    screen -r tpminer -p 0 -X stuff $'\n'
    screen -r tpminer -p 0 -X stuff "./run.sh"
    screen -r tpminer -p 0 -X stuff $'\n'
    sleep 1s
    echo "<<<如果成功了,这是您的端口号 请打开 http://服务器ip:端口 默认端口号为28888,默认token为123456"
    echo "已启动web后台 您可运行 screen -r tpminer 查看程序输出"
}

uninstall() {
    read -p "是否确认删除tpminer[yes/no]：" flag
    if [ -z $flag ]; then
        echo "输入错误" && exit 1
    else
        if [ "$flag" = "yes" -o "$flag" = "ye" -o "$flag" = "y" ]; then
            screen -X -S tpminer quit
			screen -ls|awk 'NR>=2&&NR<=20{print $1}'|awk '{print "screen -S "$1" -X quit"}'|sh
            rm -rf /root/tpminer
            echo "卸载tpminer成功"
        fi
    fi
}

update() {
    if screen -list | grep -q "tproxy"; then
        screen -X -S tpminer quit
    fi
    rm -rf /root/tpminer/tproxy
    wget https://raw.githubusercontent.com/suminerProxy/tpminer/main/tproxy -O /root/tpminer/tproxy
    chmod 777 /root/tpminer/tproxy
    screen -dmS tpminer
    sleep 0.2s
    screen -r tpminer -p 0 -X stuff "cd /root/tpminer"
    screen -r tpminer -p 0 -X stuff $'\n'
    screen -r tpminer -p 0 -X stuff "./run.sh"
    screen -r tpminer -p 0 -X stuff $'\n'

    sleep 1s
    echo "<<<如果成功了,这是您的端口号 请打开 http://服务器ip:端口 默认端口号为28888,请记录您的token"
    echo "已启动web后台 您可运行 screen -r tpminer 查看程序输出"
}

start() {
    if screen -list | grep -q "run.sh"; then
        echo -e "tpminer已启动,请勿重复启动" && exit 1
    fi
    screen -ls|awk 'NR>=2&&NR<=20{print $1}'|awk '{print "screen -S "$1" -X quit"}'|sh
    screen -dmS tpminer
    sleep 0.2s
    screen -r tpminer -p 0 -X stuff "cd /root/tpminer"
    screen -r tpminer -p 0 -X stuff $'\n'
    screen -r tpminer -p 0 -X stuff "./run.sh"
    screen -r tpminer -p 0 -X stuff $'\n'

    echo "tpminer已启动"
}

restart() {
    if screen -list | grep -q "tproxy"; then
        screen -X -S tpminer quit
    fi
	killall tproxy
	killall minerproxy
    screen -ls|awk 'NR>=2&&NR<=20{print $1}'|awk '{print "screen -S "$1" -X quit"}'|sh
    screen -dmS tpminer
    sleep 0.2s
    screen -r tpminer -p 0 -X stuff "cd /root/tpminer"
    screen -r tpminer -p 0 -X stuff $'\n'
    screen -r tpminer -p 0 -X stuff "./run.sh"
    screen -r tpminer -p 0 -X stuff $'\n'

    echo "tpminer 重新启动成功"
}

stop() {
    if screen -list | grep -q "tproxy"; then
        screen -X -S tpminer quit
    fi
	killall tproxy
	killall minerproxy
    screen -ls|awk 'NR>=2&&NR<=20{print $1}'|awk '{print "screen -S "$1" -X quit"}'|sh
    echo "tpminer 已停止"
}

change_limit(){
    num="n"
    if [ $(grep -c "root soft nofile" /etc/security/limits.conf) -eq '0' ]; then
        echo "root soft nofile 102400" >>/etc/security/limits.conf
        num="y"
    fi

    if [[ "$num" = "y" ]]; then
        echo "连接数限制已修改为102400,重启服务器后生效"
    else
        echo -n "当前连接数限制："
        ulimit -n
    fi
}

check_limit(){
    echo -n "当前连接数限制："
    ulimit -n
}

reboot_start(){
    cp /root/tpminer/rc.local /etc/
    chmod 755 /etc/rc.local
    
	echo "screen -dmS tpminer" >> /etc/rc.local
	echo "sleep 0.2s" >> /etc/rc.local
	echo "screen -r tpminer -p 0 -X stuff \"cd /root/tpminer\"" >> /etc/rc.local
	echo "screen -r tpminer -p 0 -X stuff $'\n'" >> /etc/rc.local
	echo "screen -r tpminer -p 0 -X stuff \"./run.sh\"" >> /etc/rc.local
	echo "screen -r tpminer -p 0 -X stuff $'\n'" >> /etc/rc.local
	
	echo "tpminer开机自启动已生效"
}

echo "======================================================="
echo "tpminer 一键工具"
echo "  1、安装"
echo "  2、卸载"
echo "  3、更新"
echo "  4、启动"
echo "  5、重启"
echo "  6、停止"
echo "  7、解除linux系统连接数限制(需要重启服务器生效)"
echo "  8、查看当前系统连接数限制"
echo "  9、配置开机启动"
echo "======================================================="
read -p "$(echo -e "请选择[1-9]：")" choose
case $choose in
1)
    install
    ;;
2)
    uninstall
    ;;
3)
    update
    ;;
4)
    start
    ;;
5)
    restart
    ;;
6)
    stop
    ;;
7)
    change_limit
    ;;
8)
    check_limit
    ;;
9)
    reboot_start
    ;;
*)
    echo "输入错误请重新输入！"
    ;;
esac
