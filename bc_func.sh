#!/usr/bin/bash

# bc 内置函数，在输入 bc 命令时需要使用 -l 选项
#
# s(x)    计算 x 的正弦值，x 是弧度值。
# c(x)    计算 x 的余弦值，x 是弧度值。
# a(x)    计算 x 的反正切值，返回弧度值。
# l(x)    计算 x 的自然对数。
# e(x)    求 e 的 x 次方。
# j(n, x) 贝塞尔函数，计算从 n 到 x 的阶数。

# bc 内置变量
#
# scale       指定精度，也即小数点后的位数；默认为 0，也即不使用小数部分。
# ibase       指定输入的数字的进制，默认为十进制。
# obase       指定输出的数字的进制，默认为十进制。
# last 或者 . 表示最近打印的数字

echo "scale=5;n=13/3;e(n)"|bc -l
echo "scale=4;3*8/7;last*5"|bc -l
echo "scale=4;3*8/7;.*5"|bc -l

echo "scale=2;1/3;e(.)" | bc -l

n=$(bc << EOF
ibase=16;
obase=10;
print 100
EOF
)
echo $n

var1=1
var2=2
var3=3
var4=4

m=`bc << EOF
scale=4
a1 = ($var1 * $var2)
b1 = ($var3 * $var4)
a1 + b1
EOF
`
echo The final answer for this mass is $m
