#This file has a .sh extension purely to make it easier to edit as it will highlight bash syntax.
#Aliases
alias ls='ls -laFh --color=auto'
alias alias-test='echo "Alias test successful!"'

alias enabled='systemctl list-unit-files --type=service --state=enabled'
alias timers='systemctl list-timers --all'
alias services='systemctl list-units --type=service'

alias size='du -hs'
alias rm='rm -i'
alias less='less -R'

#Networking
alias ips='ip -br -c a'
alias macs='ip -br -c l'
alias routes='ip -br -c r'

#Bash
alias bat='/usr/bin/batcat'

#Tmux
TERM=xterm-256color
if [ -f /usr/bin/tmux ]; then
	tmux source-file ~/imports/tmux.conf
fi

#Functions
cd() { builtin cd "$@" && ls; }

#Scripts
alias ifdocker='sudo bash $HOME/dotfiles/docker-interfaces.sh'

#PS1
if [ "$EUID" -eq 0 ]; then
    PS1="\[\e[0;31m\][\u@\h:\w]\[\e[0m\]\$ "
else
    PS1="\[\e[0;32m\][\u\[\e[0;36m\]@\h\[\e[0;35m\]:\w]\[\e[0m\]\$ "
fi
#comment for testing
#comment created on the remote repo
