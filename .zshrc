
#install zplug
[ ! -d ~/.zplug ] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

# Load zplug
source ~/.zplug/init.zsh

# Pure theme specifying files `async.zsh`(theme dependency) and `pure.zsh` to be loaded
zplug "sindresorhus/pure", use:"{async,pure}.zsh"
zplug "zsh-users/zsh-syntax-highlighting", from:github
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Check for uninstalled plugins and install them.
zplug check || zplug install 

# Source plugins and add commands to $PATH, add  --verbose for details
zplug load



# User configuration
export LC_ALL="en_US.UTF-8"

# Menu completion
zstyle ':completion:*' menu select

# History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
#setopt share_history

# if command isn't found, suggests a likely package to install
[[ -e /etc/zsh_command_not_found ]] && source /etc/zsh_command_not_found
export COMMAND_NOT_FOUND_INSTALL_PROMPT=1

# if you do a 'rm *', Zsh will give you a sanity check!
setopt RM_STAR_WAIT

# # Zsh has a spelling corrector
setopt CORRECT

# Configure fzf
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
