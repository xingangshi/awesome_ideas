#!/usr/bin/bash

# 需求来源于：
#   跳板机只能通过用户名密码的形式登录，终端下实在不想每次输入密码，又没法通过 `~/.ssh/config` 中增加配置完成。
#
# `~/.ssh/config` 常见配置如下
#
#Host test001
#    HostName 192.168.0.1
#    Port 22
#    User test001
#    IdentityFile ~/.ssh/id_rsa
#
# 但是这里目标机器 `192.168.0.1` 不允许使用 sshkey 免密登录，为了避免每次输入密码，使用这个脚本就可以。
#

# Expect 软件包包含一个通过执行脚本对话框与其它交互式程序通信的工具。
#
# install
# 1. debian : apt install expect
# 2. yum install -y tcl expect

function auto_login_ssh(){
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

declare -A hostInfoDict

hostInfoDict=(
    ["test001"]="192.168.0.1 22 test001 pwdtest001"
    ["test002"]="192.168.0.2 32211 test002 pwdtest002"
)

sshHostIp=$1
if [ $# -ne 1 ]; then
    sshHostIp="test001"
fi

echo $sshHostIp
echo ${hostInfoDict[$sshHostIp]}

#echo $#
#if [ $# -ne 1 ]; then
#    echo "The args are problematic need hostIPNickName"
#    exit 1
#fi

OLD_IFS="$IFS"
IFS=" "
path_info_arr=(${hostInfoDict[$sshHostIp]})
IFS="$OLD_IFS"

hostIP=${path_info_arr[0]}
hostPort=${path_info_arr[1]}
hostUser=${path_info_arr[2]}
hostPassWD=${path_info_arr[3]}

auto_login_ssh $hostPassWD $hostUser"@"$hostIP $hostPort
