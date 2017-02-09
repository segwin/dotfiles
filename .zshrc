# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle :compinstall filename '/home/loracett/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install


PROMPT=%K{246}%F{234}%n%F{246}%K{239}%F{246}%m%F{239}%K{237}%F{246}%~%F{237}%k%f
RPROMPT='%F{246}%K{246}%F{234}%D{%H:%M:%S}%f%k'


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

