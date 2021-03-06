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

## *DEPRECATED* 命令自动补全

<!--
window下, 下载 [.bash_profile.sh](./.bash_profile.sh) 和 [.git-completion.bash](./.git-completion.bash), 放到 [.gitconfig](./.gitconfig) 同目录下, 打开 git bash, 输入以下命令:

```bash
source ~/.bash_profile
```
-->

按 [[TAB]] 进行自动补全命令或提示

@date 2020-09-27
貌似 git 自己就有命令补全文件且默认是引入的, 文件: `git 安装地址`\mingw64\share\git\completion\git-completion.bash

## 个性化

**git bash**

效果图:
![git效果图](./img/效果图-vscode.png)
![git效果图](./img/效果图-bash.png)
> 若字体不支持 fontawesome 则不显示图标

步骤:
1. 新建或修改 `~\.bash_profile`, 在末尾加上:
    ```sh
    test -f ~/.profile && . ~/.profile
    test -f ~/.bashrc && . ~/.bashrc
    ```
2. 新建或修改 `~\.bashrc`, 在末尾加上:
    ```sh
    test -f ~/git-prompt.posh-git.sh && . ~/git-prompt.posh-git.sh
    test -f ~/git-prompt.oh-my-posh.sh && . ~/git-prompt.oh-my-posh.sh
    ```
3. 把 [git-prompt.posh-git.sh](./git-prompt.posh-git.sh) 和 [git-prompt.oh-my-posh.sh](./git-prompt.oh-my-posh.sh) 复制到 `~` 目录下
4. 重启 git bash

参考文档:
* [How To Customize The Git For Windows Bash Shell Prompt | Alan P. Barber](https://alanbarber.com/post/how-to-customize-the-git-for-windows-bash-shell-prompt/)
* [lyze/posh-git-sh: Bash/ZSH version of the posh-git command prompt](https://github.com/lyze/posh-git-sh)

**cmd**

参考文档:
* [Git - Git in Bash](https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Bash)

**powershell**

步骤:
1. [下载地址](https://github.com/dahlbyk/posh-git/releases/tag/v1.0.0-beta3)中下载 zip 文件并解压
2. 在 `~\Documents\WindowsPowerShell/profile.ps1` 中加入（若没有该文件, 则新建一个）:
    ```ps1
    Import-Module '解压的路径\src\posh-git.psd1'
    $GitPromptSettings.DefaultPromptPath.ForegroundColor = 'Orange'
    $GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n'
    $GitPromptSettings.DefaultPromptAbbreviateHomeDirectory=$false
    ```

参考文档:
* [Git - Git in PowerShell](https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-PowerShell)
* [dahlbyk/posh-git: A PowerShell environment for Git](https://github.com/dahlbyk/posh-git)

## 各种乱码

### PowerShell

1. 打开 powershell, 输入并运行
    ```sh
    setx LESSCHARSET 'utf-8'
    ```
2. 重启 powershell

### IntelliJ IDEA 里的 terminal

1. 把 IDEA 的 Terminal 命令窗口修改为 git bash 命令窗口
    1. File -> settings -> Tools -> Terminal
    2. `Shell path` 改为: `git 安装地址`/bin/bash.exe
2. `~\.bashrc` 末尾添加:
    ```sh
    # 解决 IDEA 下的 terminal 中文 Unicode 编码问题
    export LANG="zh_CN.UTF-8"
    export LC_ALL="zh_CN.UTF-8"
    ```
3. git 设置全局配置:
    ```sh
    # 不会对 0×80 以上的字符进行 quote
    git config --global core.quotepath false
    # 界面编码
    git config --global gui.encoding utf-8
    # 提交编码
    git config --global i18n.commitencoding utf-8
    # 日志编码
    git config --global i18n.logoutputencoding utf-8
    # svn 路径编码
    git config --global svn.pathnameencoding utf-8
    ```
