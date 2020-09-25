None='0'
BlackYellow='0;30;43'
Yellow='0;33'
BlackCyan='0;30;46'
Cyan='0;36'
CyanReverse='0;7;36'
CyanYellow='0;36;43'

__color () {
  echo \\[\\033\[$1m\\]
}

PS1='\[\033]0;git:$PWD\007\]' # set window title
PS1="$PS1"'\n'
PS1="$PS1"$(__color $Yellow)
PS1="$PS1"'⚡ '
PS1="$PS1"$(__color $None)
PS1="$PS1"'\u@\h' # user@host
PS1="$PS1"$(__color $CyanReverse)
PS1="$PS1"''
PS1="$PS1"$(__color $BlackCyan)
PS1="$PS1"' \w' # current working directory
PS1="$PS1"$(__color $CyanYellow)
PS1="$PS1"' '
PS1="$PS1"$(__color $BlackYellow)
PS1="$PS1"'`__posh_git_ps1`'   # bash function
PS1="$PS1"$(__color $Yellow)
PS1="$PS1"''
PS1="$PS1"$(__color $Cyan)
PS1="$PS1"'\n❯ '
PS1="$PS1"$(__color $None)

# for detection by MSYS2 SDK's bash.basrc
MSYS2_PS1="$PS1"
