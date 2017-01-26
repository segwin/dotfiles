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
COLOR_SUCCESS="\[\033[38;5;106m\]"
COLOR_FAILURE="\[\033[38;5;196m\]"

COLOR_BG1_F="\[\033[38;5;241m\]"
COLOR_BG1_B="\[\033[48;5;241m\]"

COLOR_BG2_F="\[\033[38;5;239m\]"
COLOR_BG2_B="\[\033[48;5;239m\]"
COLOR_FG2_F="\[\033[38;5;246m\]"

COLOR_BG3_F="\[\033[38;5;237m\]"
COLOR_BG3_B="\[\033[48;5;237m\]"
COLOR_FG3_F="\[\033[38;5;243m\]"

COLOR_BG4_F="\[\033[38;5;235m\]"
COLOR_BG4_B="\[\033[48;5;235m\]"
COLOR_FG4_F="\[\033[38;5;240m\]"

PROMPT_TIME="\[\
$COLOR_FG1_F$COLOR_BG1_B\
\`if [[ \$? = "0" ]]; then \
    echo '$COLOR_SUCCESS[\t]'; \
else \
    echo '$COLOR_FAILURE[\t]'; \
fi\`\
$COLOR_RESET$COLOR_BG2_B$COLOR_BG1_F\]"
PROMPT_USER="\[$COLOR_FG2_F$COLOR_BG2_B\u$COLOR_BG3_B$COLOR_BG2_F\]"
PROMPT_HOST="\[$COLOR_FG3_F$COLOR_BG3_B\h$COLOR_BG4_B$COLOR_BG3_F\]"
PROMPT_PATH="\[$COLOR_FG4_F$COLOR_BG4_B\w$COLOR_RESET$COLOR_BG4_F\]"
export PS1="\[$PROMPT_TIME$PROMPT_USER$PROMPT_HOST$PROMPT_PATH$COLOR_RESET\]"

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
alias tmux='echo $SSH_CLIENT | cut -d" " -f1 >~/.tmux_last_ssh_client && tmux'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


term-256-color-test()
{
    for fgbg in 38 48 ; do #Foreground/Background
        for color in {0..255} ; do #Colors
            #Display the color
            echo -en "\e[${fgbg};5;${color}m $(echo '   '${color}|tail -c 4)\e[0m "
            #Display 16 colors per lines
            if [ $((($color + 1) % 16)) == 0 ] ; then
                echo #New line
            fi
        done
        echo #New line
    done
}

export EDITOR=/usr/bin/vim

if [ -e ~/.vim/bundle/gruvbox/gruvbox_256palette.sh ]; then 
    ~/.vim/bundle/gruvbox/gruvbox_256palette.sh
fi

