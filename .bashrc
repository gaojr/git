# 别名
alias ..='cd ..'
alias ls='ls --show-control-chars --color=auto -F'
alias ll='ls --show-control-chars --color=auto -Flh'
alias la='ls --show-control-chars --color=auto -FlhA'
alias host='code /c/Windows/System32/drivers/etc/hosts'

# git 默认配置
GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
GIT_INSTALL_ROOT="${GIT_EXEC_PATH%/mingw64/libexec/git-core}"
COMPLETION_PATH="$GIT_INSTALL_ROOT/mingw64/share/git/completion"
test -f "$COMPLETION_PATH/git-completion.bash" && . "$COMPLETION_PATH/git-completion.bash"
test -f "$COMPLETION_PATH/git-prompt.sh" && . "$COMPLETION_PATH/git-prompt.sh"

# 样式
test -f ~/git-prompt.posh-git.sh && . ~/git-prompt.posh-git.sh
test -f ~/git-prompt.oh-my-posh.sh && . ~/git-prompt.oh-my-posh.sh

# 解决 IDEA 下的 terminal 中文 Unicode 编码问题
export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8"
export LESSCHARSET=utf-8

# 设置窗口标题
echo -ne "\033]0; bash \007"
