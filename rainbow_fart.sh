#/usr/bin/bash

if [[ $1 == "" ]]; then
  name="飞哥"
else
  name=$1
fi

gender="男"
if [[ $2 != "" ]]; then
  gender="女"
fi

echo -e "\n"
echo -e "\033[31m\t！！！！ $name $gender神 ！！！！\033[0m"
echo -e "\033[33m\t！！！！ $name 冲啊 ！！！！\033[0m"
echo -e "\033[36m\t！！！！ $name 生二胎  ！！！！\033[0m"
echo -e "\033[32m\t！！！！ $name 最棒 ！！！！\033[0m"
echo -e "\033[35m\t！！！！ $name 支持 ！！！！\033[0m"
echo -e "\033[34m\t！！！！ $name $gender神 ！！！！\033[0m"
echo -e "\n"

