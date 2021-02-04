sed '1i\\USERNAME USER_ID GROUP_ID HOME_DIRECTORY SHELL' /etc/passwd | awk 'BEGIN {FS=":";} {print $1,$3,$4,$6,$7}' | column -t

echo -e ""
echo "Linux /etc/passwd file : "
echo "  root:x:0:0:root:/root:/bin/bash"
echo "  \$1:\$2:\$3:\$4:\$5:\$6:\$7"
echo "  用户名:口令:用户标识号:组标识号:注释性描述:主目录:登录 Shell 名称"





