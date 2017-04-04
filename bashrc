
export PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin:$HOME/bin"

PS1='\[\033[1;32m\]\u\[\033[1;37m\]@\[\033[1;34m\]\h:\[\033[1;40m\]\w\$\[\033[0m\] ' 

export NON_LOCAL_LOGIN=`env | grep SSH`
if [ "$NON_LOCAL_LOGIN" != "" ]; then
       PS1="\033[33m[\u@\h:\w]#\033[0m "
fi;

# enable bash completion in interactive shells
if [ -f /etc/profile.d/bash_completion.sh ] && ! shopt -oq posix; then
    . /etc/profile.d/bash_completion.sh
fi


alias ls="/bin/ls --color=auto --group-directories-first"
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -al'
alias lf='ls -Fax'

alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias grepit='egrep -v "^\s*(#|$)"'



