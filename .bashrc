# If not running interactively, don't do anything
[ -z "$PS1" ] && return

BPLUG_DIR=~/.bplug/repos
function bplug() {
    REPO_NAME=$1
    FILE_TO_SOURCE=$2

    [ ! -d $BPLUG_DIR ] && mkdir -p $BPLUG_DIR
    [ ! -d $BPLUG_DIR/$REPO_NAME ] && git clone http://github.com/$REPO_NAME $BPLUG_DIR/$REPO_NAME
    [ ! -z "$FILE_TO_SOURCE" ] && source $BPLUG_DIR/$REPO_NAME/$FILE_TO_SOURCE
}

# Install fzf
if [ ! -e ~/bin/fzf ]; then
    cd ~/bin
    wget https://github.com/junegunn/fzf-bin/releases/download/0.17.1/fzf-0.17.1-linux_amd64.tgz
    tar -xf fzf-*.tgz
    rm fzf-*.tgz
    cd -
fi

# Plugins
bplug 'mrzool/bash-sensible'      'sensible.bash'
bplug 'nojhan/liquidprompt'       'liquidprompt'
bplug 'junegunn/fzf'              'shell/key-bindings.bash'
bplug 'chriskempson/base16-shell' ''

# Select color palette
eval "$(~/.bplug/repos/chriskempson/base16-shell/profile_helper.sh)"
base16_oceanicnext

# if command isn't found, suggests a likely package to install
export COMMAND_NOT_FOUND_INSTALL_PROMPT=1

[ -e ~/.shell_alias ] && source ~/.shell_alias        
[ -e ~/.shell_env ] && source ~/.shell_env            
[ -e ~/.shell_functions ] && source ~/.shell_functions
