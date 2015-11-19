
#if [ -f ~/.bash_functions ]; then
#    . ~/.bash_functions
#fi
#PS1="\[\`if [[ \$? = "0" ]]; then echo '\e[32m[\t] \u@\h\e[0m'; else echo '\e[31m[\t]\u@\h\e[0m' ; fi\`:\$PWD\n\$ "


echo -ne '\e]0;'$(id -un)@$(hostname)'\a'


function f() { find . -type f \( -name "*.c" -o -name "*.h" \) -exec  grep -n --color $@ 2>/dev/null {} +;  }

function v() { vim $(find . -type f \( -name "*.c" -o -name "*.h" \) | xargs grep -il $@ ); }
