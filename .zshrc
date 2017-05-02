zstyle ':completion:*' menu select
zstyle :compinstall filename '/home/loracett/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

setopt share_history

# if command isn't found, suggests a likely package to install
[[ -e /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found
export COMMAND_NOT_FOUND_INSTALL_PROMPT=1

ZLE_RPROMPT_INDENT=0
RPROMPT=%F{246}%K{246}%F{234}%D{%H:%M:%S}%f%k
PROMPT=%K{246}%F{234}%n%F{246}%K{239}%F{246}%m%F{239}%K{237}%F{246}%~%(?:%F{46}✔:%F{196}✘)%k%F{237}%f%G


# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias du1='sudo du -h -d 1 . 2>/dev/null | sort -r -h -k1'
alias screen='echo $SSH_CLIENT | cut -d" " -f1 >~/.screen_last_ssh_client && screen'
alias tmux='echo $SSH_CLIENT | cut -d" " -f1 >~/.tmux_last_ssh_client && tmux'
alias p='ps aux|awk '"'"'$11!~/^\[/{print $0}'"'"

export EDITOR=/usr/bin/vim

function term-256-color-test()
{
    for fgbg in 38 48 ; do #Foreground/Background
        for ((color=0; color<256; color++)); do
            #Display the color
            echo -en "\e[${fgbg};5;${color}m $(echo '   '${color}|tail -c 4)\e[0m "
            #Display 16 colors per lines
            if [ $((($color + 1) % 16)) = 0 ] ; then
                echo #New line
            fi
        done
        echo #New line
    done
}

if [ -e ~/.vim/bundle/gruvbox/gruvbox_256palette.sh ]; then 
    ~/.vim/bundle/gruvbox/gruvbox_256palette.sh
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
