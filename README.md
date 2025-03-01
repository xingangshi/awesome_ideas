# 一些想法、问题的合集

All somethings are not archived or not systemized.

## 资料

### 规范

1. [如何维护更新日志 更新日志绝对不应该是 git 日志的堆砌物](https://keepachangelog.com/zh-CN/1.1.0/)

### 开发合集

1. [free-for.dev](https://free-for.dev/#/)

## ChatGpt prompt

[Chatgpt 一些有用的 prompt](/chatgpt_prompt)

## 问题处理

### YouTube API — 获取视频缩略图

每个 YouTube 视频都有 4 个生成的图像。它们的格式可预测地如下所示：

```bash
http://img.youtube.com/vi/<insert-youtube-video-id-here>/0.jpg 0-480x360
http://img.youtube.com/vi/<insert-youtube-video-id-here>/1.jpg 1-120x90
http://img.youtube.com/vi/<insert-youtube-video-id-here>/2.jpg 2-120x90
http://img.youtube.com/vi/<insert-youtube-video-id-here>/3.jpg 3-120x90
```

列表中的第一个是全尺寸图像，其余的是缩略图。默认缩略图（即 1.jpg、2.jpg、3.jpg 之一）是，default-120x90：

```bash
http://img.youtube.com/vi/<insert-youtube-video-id-here>/default.jpg
```

对于高质量版本的缩略图，可以使用类似的 URL，hqdefault-480x360：

```bash
http://img.youtube.com/vi/<insert-youtube-video-id-here>/hqdefault.jpg
```

还有中等质量版本的缩略图，可以使用类似的 URL，mqdefault-320x180：

```bash
http://img.youtube.com/vi/<insert-youtube-video-id-here>/mqdefault.jpg 
```

对于标准定义版本的缩略图，可以使用类似的 URL，sddefault-640x480：

```bash
http://img.youtube.com/vi/<insert-youtube-video-id-here>/sddefault.jpg
```

对于最大分辨率的缩略图，可以使用类似的 URL，maxresdefault-1280x720：

```bash
http://img.youtube.com/vi/<insert-youtube-video-id-here>/maxresdefault.jpg
```

### [Git LFS](https://git-lfs.com/) error `Encountered x file(s) that should have been pointers, but weren't`

```bash
$ git reset --hard HEAD
HEAD is now at 901b26383 Start work for preparing container project.
Encountered 2 file(s) that should have been pointers, but weren't:
    testdata.zip
    container.zip
```

```bash
1.
$ git lfs migrate import --yes --no-rewrite "testdata.zip"
$ git lfs migrate import --yes --no-rewrite "container.zip"
2.
$ git push
3.
$ git reflog expire --expire-unreachable=now --all
$ git gc --prune=now
4.
$ git lfs ls-files
$ git check-attr --all -- container.zip | grep "filter: lfs"
```

### importError: cannot import name 'ParameterSource' from 'click.core'

[解决方案](https://github.com/psf/black/issues/3111)

Please uninstall black and click, Then install both to its the latest version will solve this issue.

```bash
pip uninstall black
pip uninstall click

pip install black
pip install click
```

## git Notes

### git 提交空的信息

1. `git commit` 空的提交，可以用来触发项目自动化构建相关的流程
```
git commit --allow-empty -m "空的提交信息"
```

2. 提交一个空信息来初始化一个项目
```
git init && git commit -m "初始化一个空项目" --allow-empty
```

### git 删除分支

1. 删除本地分支

删除本地分支，必须合并过的
```bash
git branch -d branch_name
```
 
删除本地分支，强制删除
```bash
git branch -D branch_name
```
``` -D ： --delete --force ```

2. 删除远程分支
```bash
git push origin --delete branch_name
```

或者

```bash
git push origin :branch_name
```

3. 批量删除本地分支

3.1 有规则的情况下
```bash
git branch -a | grep 'feature/test' | xargs git branch -D
```

3.2 排除法删除分支，保留指定分支
```bash
git branch -a | grep -v -E 'A|B' | xargs git branch -D
```

4. 批量删除远程分支
```bash
git branch -r | grep 'feature/LBSM-31' | sed 's/origin\///g' | xargs -I {} git push origin :{}
```

### 修改完善提交
```bash
# 一个 feature 开发完了，已经提交，但是没有 push，突然又想去完善，可以使用
git add .
# 将修改直接合并到上一个 commit，并且使用上次的提交
git commit --amend --no-edit
```

### 非默认的 ssh key clone 或 push
```bash
GIT_SSH_COMMAND='ssh -i ~/.ssh/another_private_key’ git push
```

### 更改 repo 远程仓库地址
```bash
git remote set-url origin new_git_repo_url
```

### git 快速切换到上一个使用的分支
```bash
git checkout -
```

## Github

[GitHub 上编写和格式化](https://docs.github.com/cn/github/writing-on-github/getting-started-with-writing-and-formatting-on-github)

## Emacs Org ledger

1. [Using Ledger for Accounting in Org-mode with Babel](https://orgmode.org/worg/org-contrib/babel/languages/ob-doc-ledger.html)
2. [Babel: active code in Org-mode](https://orgmode.org/worg/org-contrib/babel/index.html)
3. [ledger](https://www.ledger-cli.org/docs.html)

## U 盘启动盘制作工具

1. [U 盘启动盘制作工具](https://windows.pingsheme.com/up.html)
2. [win10 系统官网下载渠道](https://www.microsoft.com/zh-cn/software-download/windows10ISO)

## Debian install python3 error

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

## Ubuntu file system in wsl

> the Ubuntu file system root directory in Windows Subsystem for Linux and vice versa
>
> Each distribution you install through the store is installed to that application's appdata directory.
> For example:

`C:\Users\<username>\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState`

## Mac 下 vscode 和 sublime 等宽字体设置

> 等距更纱黑体 SC（字体名称配置为 'Sarasa Mono SC'）
>
> 'Sarasa Mono SC' 字体系统是默认没有的，需要自行下载安装，该字体为 Github 上的一个开源字体，[更纱字体](https://github.com/be5invis/Sarasa-Gothic/releases)，选择最新版本下载安装即可。

### Mac 下字体安装

> 打开 `字体册.app`，下载任意字体后，添加即可，详情见 [字体册使用手册](https://support.apple.com/zh-cn/guide/font-book/welcome/mac)。

## 电脑清理

### Windows 清理软件

> 1. [Dism++](https://www.chuyu.me/zh-Hans/)
>
> 2. [Cleanmgr+](https://www.softpedia.com/get/Security/Secure-cleaning/Cleanmgr.shtml)

### Mac 清理软件

> 1. [cleanmymac](https://cleanmymac.cn/)
>
> 2. [OmniDiskSweeper](https://www.omnigroup.com/more)
>
> 3. [柠檬清理](https://lemon.qq.com/)

## 创建一个临时的大文件，作为系统缓冲区

> 创建一个 8G 的临时文件

### 1. `dd` 命令

> `dd if=/dev/zero of=tmp.txt bs=1000M count=8`

### 2. `fallocate` 和 `truncate` 命令组合
>
> 增： `fallocate -l 8G tmp.txt`
>
> 删： `truncate -s 0 tmp.txt`

## MacBook 散热 声音很大 风扇狂转，CPU 占用很高

> 1. 查询计划任务，打开终端，输入 `pmset -g sched`；
>
> 2. 输入：`sudo pmset schedule cancelall` 取消所有的计划任务 或者 `sudo pmset schedule cancel` 取消指定的计划任务。

### Sublime Text 3 (Build 3211) License Serial

#### License

```bash
----- BEGIN LICENSE -----
Member J2TeaM
Single User License
EA7E-1011316
D7DA350E 1B8B0760 972F8B60 F3E64036
B9B4E234 F356F38F 0AD1E3B7 0E9C5FAD
FA0A2ABE 25F65BD8 D51458E5 3923CE80
87428428 79079A01 AA69F319 A1AF29A4
A684C2DC 0B1583D4 19CBD290 217618CD
5653E0A0 BACE3948 BB2EE45E 422D2C87
DD9AF44B 99C49590 D2DBDEE1 75860FD2
8C8BB2AD B2ECE5A4 EFC08AF2 25A9B864
------ END LICENSE ------
```

#### Host 增加以下的配置

``` bash
127.0.0.1 www.sublimetext.com
127.0.0.1 sublimetext.com
127.0.0.1 sublimehq.com
127.0.0.1 telemetry.sublimehq.com
127.0.0.1 license.sublimehq.com
127.0.0.1 45.55.255.55
127.0.0.1 45.55.41.223
0.0.0.0 license.sublimehq.com
0.0.0.0 45.55.255.55
0.0.0.0 45.55.41.223
```

## [Logseq](https://logseq.com/)

### [Logseq 网页版](https://logseq.xyz/)（官网已不支持网页版）

### 资料
1. [Logseq 查询（Advanced Queries）](https://logseq.github.io/#/page/advanced%20queries)
2. [Logseq 查询（Queries）](https://logseq.github.io/#/page/Queries)

### 笔记
#### 如何使用第三方插件
`设置` --> `高级设置` --> `Plugin-in system` 开关，打开 --> 重启 --> 就可以看到 `插件` 的选项。
![图示](https://raw.githubusercontent.com/apanshi/pics_center/master/tools/logseq_open_plugins_setting.png)

## Linux tips

### 1. `"Permission denied" error when editing /etc/ld.so.conf`
执行报错
```bash
sudo echo '/usr/local/lib' >> /etc/ld.so.conf
bash: /etc/ld.so.conf: Permission denied
```
修复方式
```bash
sudo sh -c "echo '/usr/local/lib' >> /etc/ld.so.conf"
```

### 2. 终端颜色配置 `Monokai-panshi`

主要解决 原生 `Monokai` 配置下，高亮红色时，在 `vim` 下显示错误提示时无法看清楚错误的字符串。

```json
        {
            "background": "#272822",
            "black": "#000000",
            "blue": "#03395C",
            "brightBlack": "#848773",
            "brightBlue": "#66D9EF",
            "brightCyan": "#66D9EF",
            "brightGreen": "#A6E22E",
            "brightPurple": "#AE81FF",
            "brightRed": "#F2BDF9",
            "brightWhite": "#F8F8F2",
            "brightYellow": "#FD971F",
            "cursorColor": "#FFFFFF",
            "cyan": "#66D9EF",
            "foreground": "#F8F8F2",
            "green": "#A6E22E",
            "name": "Monokai-panshi",
            "purple": "#AE81FF",
            "red": "#F92672",
            "selectionBackground": "#FFFFFF",
            "white": "#F8F8F2",
            "yellow": "#FFE792"
        }
```

### 3. 部分网友的逻辑（Github mermaid 测试）

```mermaid
graph LR
    O([乌克兰 死了活该])
    A[乌克兰] --> B{是否抵抗}
    B --> |否| C[[没有准备就挑衅]]
    C --> K[俄罗斯]
    K --> M((死了活该))
    B --> |是| D{抵抗是否顽强}
    D --> |否| E[[没有实力就挑衅]]
    E --> K
    D --> |是| F{有无西方武器}
    F --> |无| G{西方是否出兵}
    G --> |否| H[被西方耍了 傻逼 竟然挑衅]
    H --> K
    F --> |有| J[[不出所料 勾结西方 威胁]]
    J --> K
    G --> |是| J
```

## [Docker 下 redis 集群部署](/docker_redis.md)
