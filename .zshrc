# Path to your oh-my-zsh installation.
export ZSH=/home/loracett/scm/dotfiles/oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
ZSH_THEME="bureau"

#RPROMPT=%F{246}%K{246}%F{234}%D{%H:%M:%S}%f%k
#PROMPT=%{%K{246}%F{234}%}%n%{%F{246}%K{239}%}%{%F{246}%}%m%{%F{239}%K{237}%}%{%F{246}%}%~%{%(?:%F{46}%} ✔%{:%F{196}%} ✘%{)%k%F{237}%}%{%f%}
#
#RPROMPT=%F{252}%K{252}%F{235}%D{%H:%M:%S}%f%k
#PROMPT=%{%K{252}%F{235}%}%n%{%F{252}%K{236}%}%{%F{247}%}%m%{%F{236}%K{234}%}%{%F{247}%}%~%{%(?:%F{46}%} ✔%{:%F{196}%} ✘%{)%k%F{234}%}%{%f%}

# disable marking untracked files under VCS as dirty. This makes repository 
# status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# oh-my-zsh: plugins can be found in ~/.oh-my-zsh/plugins/*
plugins=(git virtualenvwrapper)

source $ZSH/oh-my-zsh.sh

# User configuration
export LC_ALL="en_US.UTF-8"

zstyle ':completion:*' menu select
zstyle :compinstall filename '/home/loracett/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e

#setopt share_history

# if command isn't found, suggests a likely package to install
[[ -e /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found
export COMMAND_NOT_FOUND_INSTALL_PROMPT=1

ZLE_RPROMPT_INDENT=0

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# # Zsh has a spelling corrector
setopt CORRECT

if [ -f ~/.fzf.zsh ] ; then
    source ~/.fzf.zsh
    export FZF_COMPLETION_TRIGGER=''
    bindkey '^T' fzf-completion
    bindkey '^I' $fzf_default_completion
fi


# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
# Emacs style
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line


[ -e ~/.shell_alias ] && source ~/.shell_alias 
[ -e ~/.shell_env ] && source ~/.shell_env
[ -e ~/.shell_functions ] && source ~/.shell_functions
