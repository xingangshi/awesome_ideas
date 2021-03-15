# dustbin

All somethings are not archived or not systemized.

---

### Github
[GitHub 上编写和格式化](https://docs.github.com/cn/github/writing-on-github/getting-started-with-writing-and-formatting-on-github)

### Emacs Org ledger
1. [Using Ledger for Accounting in Org-mode with Babel](https://orgmode.org/worg/org-contrib/babel/languages/ob-doc-ledger.html)
2. [Babel: active code in Org-mode](https://orgmode.org/worg/org-contrib/babel/index.html)
3. [ledger](https://www.ledger-cli.org/docs.html)

### U 盘启动盘制作工具
1. [U盘启动盘制作工具](https://windows.pingsheme.com/up.html)
2. [win10 系统官网下载渠道](https://www.microsoft.com/zh-cn/software-download/windows10ISO)

### Debian install python3 error
> error is `dpkg: error processing package python3`

```bash
➜  org git:(master) apt install python3
....
....
dpkg: error processing package python3 (--configure):
 package is in a very bad inconsistent state; you should
 reinstall it before attempting configuration
Errors were encountered while processing:
 python3
E: Sub-process /usr/bin/dpkg returned an error code (1)

➜  org git:(master) sudo dpkg --remove --force-remove-reinstreq python3

➜  org git:(master) apt install python3
```

### Ubuntu file system in wsl
> the Ubuntu file system root directory in Windows Subsystem for Linux and vice versa
>
> Each distribution you install through the store is installed to that application's appdata directory.
> For example:

`C:\Users\<username>\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState`

### Mac 下 vscode 和 sublime 等宽字体设置
> 等距更纱黑体 SC（字体名称配置为 'Sarasa Mono SC'）
>
>  'Sarasa Mono SC' 字体系统是默认没有的，需要自行下载安装，该字体为 Github 上的一个开源字体，[更纱字体](https://github.com/be5invis/Sarasa-Gothic/releases)，选择最新版本下载安装即可。
#### Mac 下字体安装
> 打开 `字体册.app`，下载任意字体后，添加即可，详情见 [字体册使用手册](https://support.apple.com/zh-cn/guide/font-book/welcome/mac)。 
