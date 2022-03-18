### Wolfram 语言：快速编程入门

#### [简介](https://www.wolfram.com/language/fast-introduction-for-programmers/zh/)

只需花几分钟学习该教程，您就可以快速了解 Wolfram 语言的基础.

精心集成了近 6000 个内置函数为您提供计算知识！Wolfram 语言内容极其丰富，所要学习的内容甚多！该教程将教会您阅读和理解几乎所有 Wolfram 语言代码，并开始自己使用 Wolfram 语言进行编程。

[相关参考资料](https://reference.wolfram.com/language/index.html.zh?source=footer)

#### [在线编辑器 wolframcloud](https://www.wolframcloud.com/)

#### 例子

一个四位数，如果把数字 5 加在它的前面可以得到一个五位数，加在后面也可以得到一个五位数，且这两个五位数相差 14787，那么原来的四位数是多少？*

```wolframe
3. 一个四位数，如果把数字 5 加在它的前面可以得到一个五位数，加在后面也可以得到一个五位数，且这两个五位数相差 14787，那么原来的四位数是多少？

Solve[{
    x == 1000a + 100b+10c+d,
    50000 + x - (10000 a + 1000 b + 100c + 10d + 5) == 14787,
    10 + d- 5 == 7,
    10 + c -1 - d == 8,
    b -1 - c == 7,
    10 + a - b ==4,
    5 - a - 1 == 1,
    },
    x
]
```

[在线编辑器](https://www.wolframcloud.com/) 运算展示

![输出结果](/pics/hello_wolframe.png)
