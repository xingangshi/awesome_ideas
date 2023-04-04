#!/usr/bin/bash

# 终端跳板机
#
# 需求来源于：
#   跳板机只能通过用户名密码的形式登录，终端下实在不想每次输入密码，又没法通过 `~/.ssh/config` 中增加配置完成。
#
# 功能：
#   1. 账号密码形式下，每次不需要单独输入密码， 即可免密登录
#   2. ssh 密钥形势下，可以直接登录
#   3. 可以设置默认的登录服务器
#
# 使用：
#   仅需打开编辑此文件，在 `hostInfoDict` 配置中 设置服务器信息，如下：
#       ["服务器别名"]=["认证方式（pwd/rsa） ip port 用户名 密码/密钥路径"]
#
#  然后终端输入即可登录，例如：
#   `$bash ssh_auto_login_by_passwd.sh test004`

# `~/.ssh/config` 常见配置如下
#
#Host test001
#    HostName 192.168.0.1
#    Port 22
#    User test001
#    IdentityFile ~/.ssh/id_rsa
#
# 但是这里目标机器 `192.168.0.1` 不允许使用 sshkey 免密登录，为了避免每次输入密码，使用这个脚本就可以。

# Expect 软件包包含一个通过执行脚本对话框与其它交互式程序通信的工具。
#
# install
# 1. debian : apt install expect
# 2. yum install -y tcl expect

declare -A hostInfoDict

defaultLoginServer="test001"

hostInfoDict=(
    #["服务器别名"]=["认证方式（pwd/rsa） ip port 用户名 密码/密钥路径"]
    ["test001"]="pwd 192.168.0.1 22 test001 pwdtest001"
    ["test002"]="pwd 192.168.0.2 32211 test002 pwdtest002"
    ["test003"]="rsa 192.168.0.1 22 test003 ~/.ssh/id_rsa"
    ["test004"]="rsa 192.168.0.2 32211 test004 ~/.ssh/id_rsa_test004"
)

function auto_login_ssh_pwd(){
    expect -c "
    set timeout 3600;
    spawn ssh -o StrictHostKeyChecking=no $2 -p $3;
    expect {
        *assword:* {
            send $1\r;
        }
    }
    interact
    "
    return $?
}

function auto_login_ssh_rsa(){
    ssh $2 -p$3 -i $1
    return $?
}

function auto_login_ssh(){
    if [ $1 == "pwd" ]; then
        auto_login_ssh_pwd $2 $3"@"$4 $5
    else
        auto_login_ssh_rsa $2 $3"@"$4 $5
    fi
}

function help(){
    echo ".                                                                           "
    echo "终端跳板机                                                                  "
    echo ".                                                                           "
    echo "使用： ssh_auto_login_by_passwd.sh [options] [target]                       "
    echo ".                                                                           "
    echo "  仅需打开编辑此文件，在 \`hostInfoDict\` 配置中 设置服务器信息，如下：     "
    echo "     [\"服务器别名\"]=[\"认证方式（pwd/rsa） ip port 用户名 密码/密钥路径\"]"
    echo ".                                                                           "
    echo "  然后终端输入即可登录，例如：                                              "
    echo "    \`\$bash ssh_auto_login_by_passwd.sh test001\`                          "
    echo ".                                                                           "
    echo "Options:                                                                    "
    echo "  -h, --help 显示帮助文档                                                   "
    echo "  -s, --show 显示当前配置的服务器信息                                       "
    echo ".                                                                           "
    echo "target:                                                                     "
    echo "  \`hostInfoDict\` 中配置的 服务器别名，可以在配置中指定默认的登录服务器    "
    echo ".                                                                           "
}

function show_server_info(){
    echo "All can used server infos:"
    for key in "${!hostInfoDict[@]}"; do
        OLD_IFS="$IFS"
        IFS=" "
        value=(${hostInfoDict[$key]})
        IFS="$OLD_IFS"
        echo -e "\tname $key ip:port ${value[1]}:${value[2]}"
    done
}

function check_server_info(){
  if [ -n "${hostInfoDict[$1]}" ]; then
    echo 1
  else
    echo 0
  fi
}

if [ "$1" == "-h" -o "$1" == "--help" ]; then
    help
    exit 1
elif [ "$1" == "-s" -o "$1" == "--show" ]; then
    show_server_info
    exit 1
fi

sshHostIp=$1
if [ $# -ne 1 ]; then
    sshHostIp=$defaultLoginServer
fi

status=`check_server_info $sshHostIp`
if [ $status == 0 ]; then
  echo "server name $sshHostIp is not OK!"
  exit 1
fi

echo "Server Name : " $sshHostIp
echo "Server Info : " ${hostInfoDict[$sshHostIp]}

OLD_IFS="$IFS"
IFS=" "
path_info_arr=(${hostInfoDict[$sshHostIp]})
IFS="$OLD_IFS"

loginType=${path_info_arr[0]}
hostIP=${path_info_arr[1]}
hostPort=${path_info_arr[2]}
hostUser=${path_info_arr[3]}
hostPassWD=${path_info_arr[4]}

auto_login_ssh $loginType $hostPassWD $hostUser $hostIP $hostPort
