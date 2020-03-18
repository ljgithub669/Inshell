#!/bin/bash
#######################################################
#                     脚本控制                        #
#                     By Aspire                       #
#                     2020-3-18                       #
#######################################################

#函数要放在被调用处前面
function change()
{
sudo mv /etc/apt/sources.list /etc/apt/sources.list.back
sudo touch /etc/apt/sources.list
sudo chmod 777 /etc/apt/*
sudo cat>>/etc/apt/sources.list<<EOF    #多行输入
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-proposed main restricted universe multiverse
EOF

cd ~/.pip
touch pip.conf
sudo chmod 777 ~/*
echo -e "[global] index-url = https://pypi.tuna.tsinghua.edu.cn/simple ">pip.conf
sudo apt-get update -y
sudo apt-get upgrade -y
menu
}

install()
{
#######################################################
#              一键自动安装linux常用软件              #
#                      Ubuntu版                       #
#                     By Aspire                       #
#                     2020-3-18                       #
#######################################################
#安装vim
echo '#################################################'
echo "#                     安装vim                   #"
echo '#################################################'
sudo apt-get install -y vim
echo '#################################################'
echo "#                   git安装完毕                 #"
echo '#################################################'
#安装git
echo '#################################################'
echo "#                     安装git                   #"
echo '#################################################'
sudo apt-get install -y git
echo '#################################################'
echo "#                   git安装完毕                 #"
echo '#################################################'
#安装php
echo '#################################################'
echo "#                     安装php                   #"
echo '#################################################'
sudo apt-get install -y php
echo '#################################################'
echo "#                   php安装完毕                 #"
echo '#################################################'
#安装apache2
echo '#################################################'
echo "#                   安装apache2                 #"
echo '#################################################'
sudo apt-get install -y apache2
echo '#################################################'
echo "#                 apache2安装完毕               #"
echo '#################################################'
#安装mysqy-sever
echo '#################################################'
echo "#                 安装mysql-sever               #"
echo '#################################################'
sudo apt-get install -y mysql-sever
echo '#################################################'
echo "#               mysql-sever安装完毕             #"
echo '#################################################'
sudo apt install python3-pip
menu
}

function py_install()
{
sudo pip3 install -i https://pypi.tuna.tsinghua.edu.cn/simple  opencv-python numpy matplotlib tensorflow keras dlib
menu
}

menu()
{
source ~/.bashrc
echo "################################################"
echo "#              Please enter your choise:       #"
echo "#              (0) 换源                        #"
echo "#              (1) 安装系统常用软件            #"
echo "#              (2) 安装python3常用库           #"
echo "#              (q) Exit Menu                   #"
echo "################################################"

read input
 
case $input in
	    0)
	        change;;
	    1)
		install;;
	    2)
		py_install;;
	    q)
                exit;;
esac
}

#执行menu函数
menu
