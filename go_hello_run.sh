#!/bin/bash

# 查看 bash 类型
#cat /etc/shells

#echo "<green>use go default bin path /root/go/bin </green>" | tml
#echo "<red>this text is <bold>red</bold></red> and the following is <green>not red</green>" | /root/go/bin/tml
#
#echo "<red>this text is <bold>red</bold></red> and the following is <green>not red</green>" | tml

go run go_hello.go

go build go_hello.go
./go_hello
rm go_hello

