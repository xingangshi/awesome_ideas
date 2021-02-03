curl -s https://v1.alapi.cn/api/new/wbtop\?num\=50 | grep hot_word\" | sed 's/[ \t]*//g' | awk '{ printf "%-2d : %-30s\n",  NR, substr($1, 13, length($1) - 14)}'

#echo "---------------"
#curl -s https://v1.alapi.cn/api/new/wbtop\?num\=50 | grep hot_word\" | sed 's/[ \t]*//g' | awk '{ printf "%-2d : %-30s\n",  NR, substr($1, 13, length($1) - 14)}'| grep  -E "上海|疫情|石家庄|通报|回应|西安"
#echo "---------------"

