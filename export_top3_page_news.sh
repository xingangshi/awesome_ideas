name="top_news"`date +"%Y%m%d-%H%M"`

mkdir -p /mnt/e/top_news
file_path="/mnt/e/top_news/"$name".html"

curl -s http://ihuaiyin.e23.cn/index.php\?m\=content\&c\=index\&a\=lists\&catid\=6\&page\=1 | grep -E 'span class="rt"' | grep -E '_blank' | sed 's/\t//g; s/<li\ class="bk20\ hr"><\/li>//g; s/\ //g; s/>/\ /g' | awk '{ printf "%-2d : %-10s <a href=\"%-50s\">%-50s</a></br>\n",  NR, substr($3, 0, length($3) - 5 - 8), substr($4, 11, length($4)-26), substr($5, 0, length($5)- 2)}' | sed 's/\ //7' >$file_path
curl -s http://ihuaiyin.e23.cn/index.php\?m\=content\&c\=index\&a\=lists\&catid\=6\&page\=2 | grep -E 'span class="rt"' | grep -E '_blank' | sed 's/\t//g; s/<li\ class="bk20\ hr"><\/li>//g; s/\ //g; s/>/\ /g' | awk '{ printf "%-2d : %-10s <a href=\"%-50s\">%-50s</a></br>\n",  NR + 25, substr($3, 0, length($3) - 5 - 8), substr($4, 11, length($4)-26), substr($5, 0, length($5)- 2)}' | sed 's/\ //7' >>$file_path
curl -s http://ihuaiyin.e23.cn/index.php\?m\=content\&c\=index\&a\=lists\&catid\=6\&page\=3 | grep -E 'span class="rt"' | grep -E '_blank' | sed 's/\t//g; s/<li\ class="bk20\ hr"><\/li>//g; s/\ //g; s/>/\ /g' | awk '{ printf "%-2d : %-10s <a href=\"%-50s\">%-50s</a></br>\n",  NR + 50, substr($3, 0, length($3) - 5 - 8), substr($4, 11, length($4)-26), substr($5, 0, length($5)- 2)}' | sed 's/\ //7' >>$file_path
