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
COLOR_RESET="$(tput sgr0)"

COLOR_BG1_F="\033[38;5;246m"
COLOR_BG1_B="\033[48;5;246m"
COLOR_FG1="\033[38;5;234m"
COLOR_FG1_SUCCESS="\033[38;5;106m"
COLOR_FG1_FAILURE="\033[38;5;196m"

COLOR_BG2_F="\033[38;5;239m"
COLOR_BG2_B="\033[48;5;239m"
COLOR_FG2_F="\033[38;5;246m"

COLOR_BG3_F="\033[38;5;237m"
COLOR_BG3_B="\033[48;5;237m"
#COLOR_FG3_F="\033[38;5;243m"
COLOR_FG3_F="\033[38;5;246m"

COLOR_BG4_F="\033[38;5;235m"
COLOR_BG4_B="\033[48;5;235m"
#COLOR_FG4_F="\033[38;5;240m"
COLOR_FG4_F="\033[38;5;246m"
COLOR_FG1_FAILURE_DARK="\033[38;5;88m"

#PS1="\[\`if [[ \$? = "0" ]]; then echo '$COLOR_FG1_SUCCESS'; else echo '$COLOR_FG1_FAILURE'; fi\`\]"
PS1="\[$COLOR_FG1\]"
PS1+="\[$COLOR_BG1_B\]\u\[$COLOR_BG2_B$COLOR_BG1_F\]"
PS1+="\[$COLOR_FG2_F$COLOR_BG2_B\]\h\[$COLOR_BG3_B$COLOR_BG2_F\]"
PS1+="\[$COLOR_FG3_F$COLOR_BG3_B\]\w\[$COLOR_BG4_B$COLOR_BG3_F\]"
PS1+="\[$COLOR_FG4_F$COLOR_BG4_B\]\t\[$COLOR_RESET$COLOR_BG4_F\]"
PS1+="\[$COLOR_BG4_B\]\[\`if [[ \$? = "0" ]]; then echo '\[${COLOR_FG1_SUCCESS}\] ✔'; else echo '\[${COLOR_FG1_FAILURE}\] ✘'; fi\`\]\[$COLOR_RESET$COLOR_BG4_F\]"
PS1+="\[$COLOR_RESET\]"
export PS1

# if command isn't found, suggests a likely package to install
export cOMMAND_NOT_FOUND_INSTALL_PROMPT=1

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -e ~/.shell_alias ] && source ~/.shell_alias 
[ -e ~/.shell_env ] && source ~/.shell_env
[ -e ~/.shell_functions ] && source ~/.shell_functions
