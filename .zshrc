export LC_ALL="en_US.UTF-8"

#install zplug
[ ! -d ~/.zplug ] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh

# Load zplug
source ~/.zplug/init.zsh

zplug "zplug/zplug"                                     # Let zplug manage zplug
zplug "yous/vanilli.sh"                                 # A lightweight start point of shell configuration
zplug "zsh-users/zsh-completions"                       # Additional completion definitions for Zsh
zplug "zsh-users/zsh-autosuggestions"                   # suggest commands from history
# zplug "yous/lime"                                       # Simple prompt
zplug "nojhan/liquidprompt"                             # more complexe prompt
zplug "chriskempson/base16-shell"                       # Color palette
zplug "plugins/command-not-found.plugin.zsh", from:oh-my-zsh # Suggest to install if command not found
zplug "zsh-users/zsh-syntax-highlighting", defer:2       # Syntax highlighting
zplug "zsh-users/zsh-history-substring-search", defer:3  # ZSH port of Fish shell's history search feature

# A command-line fuzzy finder
zplug "junegunn/fzf-bin", from:gh-r, as:command, rename-to:fzf, use:"*linux*amd64*"
bindkey -e # use emacs mode (^a ^e etc.)
zplug "junegunn/fzf", use:"shell/key-bindings.zsh"

# Check for uninstalled plugins and install them.
zplug check || zplug install 

# Source plugins and add commands to $PATH, add  --verbose for details
zplug load

#prompt for 'Do you want to install it? (N/y)' if command not found
export COMMAND_NOT_FOUND_INSTALL_PROMPT=1

# if you do a 'rm *', Zsh will give you a sanity check!
#setopt RM_STAR_WAIT

# # Zsh has a spelling corrector
setopt CORRECT

# Enable Ctrl-x-e to edit command line
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line


[ -e ~/.shell_alias ] && source ~/.shell_alias 
[ -e ~/.shell_env ] && source ~/.shell_env
[ -e ~/.shell_functions ] && source ~/.shell_functions

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
