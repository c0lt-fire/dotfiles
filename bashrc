
export PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin:$HOME/bin:$HOME/bin/photo"

if [ $(id -u) -eq 0 ]; then
    #root
    PS1='\[\033[1;35m\]\u\[\033[1;37m\]@\[\033[1;31m\]\h:\[\033[1;40m\]\w\$\[\033[0m\] '
else
    PS1='\[\033[1;32m\]\u\[\033[1;37m\]@\[\033[1;31m\]\h:\[\033[1;40m\]\w\$\[\033[0m\] ' 
fi

EDITOR=vim

# enable bash completion in interactive shells
if [ -f /etc/profile.d/bash_completion.sh ] && ! shopt -oq posix; then
    . /etc/profile.d/bash_completion.sh
fi


# Define some useful aliases:
alias ls="/bin/ls --color=auto --group-directories-first"
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias lf='ls -Fax'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias grepit='egrep -v "^\s*(#|$)"'

lsp() { basename $(ls -1 "/var/log/packages/$@"*) ; }
alias md="mkdir"
alias tarview="tar -tvf"

PROMPT_COMMAND='echo -en "\033]0;$(whoami)@$(hostname|cut -d "." -f1):$(pwd|sed 's#/home/mago#~#')\a"'


alias tmux="TERM=screen-256color-bce tmux"
