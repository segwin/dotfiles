# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# for setting history, see in bash(1)
shopt -s histappend
HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

#colors
COLOR_RESET="\[$(tput sgr0)\]"
COLOR_RED="\[\033[0;31;48m\]"
COLOR_GREEN="\[\033[0;32;48m\]"
COLOR_CYAN="\[\033[0;36;48m\]"
COLOR_BLUE="\[\033[1;34;48m\]"
COLOR_GREY="\[\033[38;5;241m\]"
COLOR_BRIGHT_RED="\[\033[1;31;48m\]"

TIME_COLORED_CMD_PASS_FAIL="\[\`if [[ \$? = "0" ]]; then echo '$COLOR_GREEN[\t]$COLOR_RESET'; else echo '$COLOR_RED[\t]$COLOR_RESET'; fi\`\]"


trap 'echo -ne "\e]0;"; echo -n "bash $PWD\$ $BASH_COMMAND"; echo -ne "\007"' DEBUG >/dev/null

export PS1="\[$TIME_COLORED_CMD_PASS_FAIL $COLOR_CYAN\u$COLOR_RESET@$COLOR_BLUE\h$COLOR_RESET:$COLOR_GREY\w$COLOR_RESET$COLOR_BRIGHT_RED\[\$ \]$COLOR_RESET\]"

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias du1='sudo du -h -d 1 . 2>/dev/null | sort -r -h -k1'
alias screen='echo $SSH_CLIENT | cut -d" " -f1 >~/.screen_last_ssh_client && screen'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

term-color-test()
{
    for a in 0 1 4 5 7; do
        echo "a=$a " 
        for (( f=0; f<=9; f++ )) ; do
            for (( b=0; b<=9; b++ )) ; do
                #echo -ne "f=$f b=$b" 
                echo -ne "\\033[${a};3${f};4${b}m"
                echo -ne "\\\\\\\\033[${a};3${f};4${b}m"
                echo -ne "\\033[0m "
            done
            echo
        done
        echo
    done
    echo
}


export EDITOR=/usr/bin/vim
