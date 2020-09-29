# 别名
alias la='ls -lAh'
alias ll='ls -lh'
alias ls='ls --color=tty'

# git 默认配置
COMPLETION_PATH="$GIT_INSTALL_ROOT\mingw64\share\git\completion"
test -f "$COMPLETION_PATH/git-completion.bash" && . "$COMPLETION_PATH/git-completion.bash"
test -f "$COMPLETION_PATH/git-prompt.sh" && . "$COMPLETION_PATH/git-prompt.sh"

# 样式
test -f ~/git-prompt.posh-git.sh && . ~/git-prompt.posh-git.sh
test -f ~/git-prompt.oh-my-posh.sh && . ~/git-prompt.oh-my-posh.sh

# 解决 IDEA 下的 terminal 中文 Unicode 编码问题
export LANG="zh_CN.UTF-8"
export LC_ALL="zh_CN.UTF-8"
