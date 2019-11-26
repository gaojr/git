# git

git 相关

## 配置

| 参数     | 适用范围             | 文件位置                             |
| -------- | -------------------- | ------------------------------------ |
| --system | 系统所有用户和所有库 | `git 安装地址`/mingw64/etc/gitconfig |
| --global | 具体用户             | C:/Users/`用户名`/.gitconfig         |
| --local  | 具体项目             | `项目地址`/.git/gitconfig            |

默认为 `local`

[.gitconfig](./.gitconfig) 文件为 global 级的配置文件

## 命令自动补全

window下, 下载 [.bash_profile.sh](./.bash_profile.sh) 和 [.git-completion.bash](./.git-completion.bash), 放到 [.gitconfig](./.gitconfig) 同目录下, 打开 git bash, 输入以下命令:

```bash
source ~/.bash_profile
```

之后使用时按 [[TAB]] 进行自动补全命令或提示

参考:
* [Git - Git in Bash](https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Bash)
* [Git - Git in PowerShell](https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-PowerShell)

## IntelliJ IDEA 下 terminal 乱码问题

1. 把 IDEA 的 Terminal 命令窗口修改为 git bash 命令窗口
    1. File -> settings -> Tools -> Terminal
    2. `Shell path` 改为: `git 安装地址`/bin/bash.exe
2. `git 安装地址`/etc/bash.bashrc 末尾添加:
    ```
    # 解决IDEA下的terminal中文Unicode编码问题
    export LANG="zh_CN.UTF-8"
    export LC_ALL="zh_CN.UTF-8"
    ```
3. git 设置全局配置:
    ```
    # 界面编码
    git config --global gui.encoding utf-8 
    # 提交编码
    git config --global i18n.commitencoding utf-8
    # 日志编码
    git config --global i18n.logoutputencoding utf-8
    ```
