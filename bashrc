
export PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin:$HOME/.local/bin:$HOME/bin:$HOME/bin/photo"

if [ $(id -u) -eq 0 ]; then
    #root
    PS1='\[\033[1;35m\]\u\[\033[1;37m\]@\[\033[1;31m\]\h:\[\033[1;40m\]\w\$\[\033[0m\] '
else
    PS1='\[\033[1;32m\]\u\[\033[1;37m\]@\[\033[1;31m\]\h:\[\033[1;40m\]\w\$\[\033[0m\] ' 
fi

export EDITOR=vim

# enable bash completion in interactive shells
if [ -f /etc/profile.d/bash_completion.sh ] && ! shopt -oq posix; then
    . /etc/profile.d/bash_completion.sh
fi

. ~/.bash_aliases


PROMPT_COMMAND='echo -en "\033]0;$(whoami)@$(hostname|cut -d "." -f1):$(pwd|sed 's#/home/mago#~#')\a"'

lsp() { basename $(ls -1 "/var/log/packages/$@"*) ; }

#. ~/.minimal.bash
