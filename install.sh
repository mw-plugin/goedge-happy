#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin:/opt/homebrew/bin
export PATH

curPath=`pwd`
rootPath=$(dirname "$curPath")
rootPath=$(dirname "$rootPath")
serverPath=$(dirname "$rootPath")

install_tmp=${rootPath}/tmp/mw_install.pl
VERSION=$2

# systemctl status goedge-admin

ARCH=`uname -m`
ARCH_NAME=''
case $(uname -m) in
    i386)   ARCH_NAME="386" ;;
    i686)   ARCH_NAME="386" ;;
    x86_64) ARCH_NAME="amd64" ;;
    arm)    ARCH_NAME="arm64" ;;
	arm64)  ARCH_NAME="arm64" ;;
esac

Install_App()
{
	echo '正在安装脚本文件...' > $install_tmp
	mkdir -p $serverPath/source
	mkdir -p $serverPath/source/goedge_happy

	mkdir -p $serverPath/goedge-happy

	FILE_TGZ=edge-admin-linux-${ARCH_NAME}-plus-v1.3.9.zip
	GOEDGE_DIR=$serverPath/source/goedge_happy

	# https://github.com/mw-plugin/goedge-happy/releases/download/1.0/edge-admin-linux-amd64-plus-v1.3.9.zip
	if [ ! -f $GOEDGE_DIR/${FILE_TGZ} ];then
		wget -O $GOEDGE_DIR/${FILE_TGZ} https://github.com/mw-plugin/goedge-happy/releases/download/1.0/${FILE_TGZ}
	fi
	
	if [ ! -d $GOEDGE_DIR/edge-happy/edge-admin ];then
		cd $GOEDGE_DIR && unzip ${FILE_TGZ}
	fi

	if [ -d $GOEDGE_DIR/edge-happy ];then
		cp -rf $GOEDGE_DIR/edge-happy/* $serverPath/goedge-happy/
	fi

	if [ -d $GOEDGE_DIR/${FILE_TGZ} ];then
		rm -rf $GOEDGE_DIR/${FILE_TGZ}
	fi

	echo "${VERSION}" > $serverPath/goedge-happy/version.pl

	cd ${rootPath} && python3 ${rootPath}/plugins/goedge-happy/index.py start
	cd ${rootPath} && python3 ${rootPath}/plugins/goedge-happy/index.py initd_install

	echo '安装goedge完成'
}

Uninstall_App()
{
	if [ -f /usr/lib/systemd/system/goedge-happy.service ];then
		systemctl stop goedge-happy
		systemctl disable goedge-happy
		rm -rf /usr/lib/systemd/system/goedge-happy.service
		systemctl daemon-reload
	fi

	if [ -f /lib/systemd/system/goedge-happy.service ];then
		systemctl stop goedge-happy
		systemctl disable goedge-happy
		rm -rf /lib/systemd/system/goedge-happy.service
		systemctl daemon-reload
	fi

	if [ -d $serverPath/goedge-happy ];then
		rm -rf $serverPath/goedge-happy
	fi
	
	echo "卸载goedge成功"
}

action=$1
if [ "${1}" == 'install' ];then
	Install_App
else
	Uninstall_App
fi
