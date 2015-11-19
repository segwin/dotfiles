export EDITOR=/usr/bin/vim
export SVN_MERGE=/home/loracett/diffwrap.sh

PS1="\[\`if [[ \$? = "0" ]]; then echo '\e[32m[\t] \u@\h\e[0m'; else echo '\e[31m[\t]\u@\h\e[0m' ; fi\`:\$PWD\n\$ "

if [ -f ~/.bash_functions ]; then
    . ~/.bash_functions
fi

