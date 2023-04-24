#!/bin/zsh

i=0
icon=''
arr=('|' '/' '-' '\')
index=0

cur_time_stamp=`date +%s`

cur_year_str=`date -r $cur_time_stamp +%Y`"-01-01 00:00:00"
cur_year_start=`date -j -f "%Y-%m-%d %H:%M:%S" "$cur_year_str" +%s`

next_year_str=$((`date -r $cur_time_stamp +%Y` + 1))"-01-01 00:00:00"
next_year_start=`date -j -f "%Y-%m-%d %H:%M:%S" "$next_year_str" +%s`

percentage=$(($(($(($cur_time_stamp - $cur_year_start)) * 100))/ $(($next_year_start - $cur_year_start))))

echo -e ""
while [ $i -le 50 ]
do
  ((i++))
  index=`echo $cur_time_stamp%4`
  if [ $i -le $((50 - $(($percentage / 2)))) ]; then
    icon='.'$icon
  else
    icon=':'$icon
  fi
done
printf "[\033[32m%-50s\033[0m] 2023 Year Progress [ \033[31m%d%%\033[0m ] [%c]\r" "$icon" "$percentage" "${arr[$index]}"
echo -e "\n"

