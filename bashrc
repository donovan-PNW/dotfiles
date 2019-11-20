# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi
# Add git branch if its present to PS1
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
 PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[01;31m\]$(parse_git_branch)\[\033[00m\]\$ '
else
 PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w$(parse_git_branch)\$ '
fi

#git autocomplete
source ~/.bash/git-completion.bash

# if [ "$color_prompt" = yes ]; then
#     PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
# else
#     PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
# fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ls='ls -GH'
alias ls='ls -GH'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
alias opensudo='sudo nautilus /'
alias open='nautilus'
alias portlandcc='ssh xxxx.xxxx@syccuxas01.pcc.edu'
alias rm='rm -i'
alias cp='cp -i'
set -o noclobber
alias mv='mv -vn'
alias sudo='sudo '
alias swapThis='find . -type f -name "*.swp" -exec rm -f {} \;'
alias Vuze='cd /media/myUsername/Dingo\ Starr/Downloads/Vuze\ Downloads'
alias raspi='ssh pi@raspberrypi.local -p 5678'
alias farpi='ssh pi@73.190.96.234 -p 5678'
alias pacman='sudo apt update && sudo apt upgrade -y ; sudo apt autoremove -y; beep ; sudo vim /etc/systemd/logind.conf'
alias sqlite='sqlite3'
alias esad='killall -9'
alias python='python3'
alias pip='pip3'
alias top='htop'
alias beep='paplay /usr/share/sounds/ubuntu/notifications/Positive.ogg'
alias weather='curl wttr.in/portland?u'
alias mycal='gcalcli calm ; sleep 5; gcalcli agenda'
alias startup='curl wttr.in/portland?u; sleep 5; gcalcli calw now 4 ; sleep 5 ; gcalcli agenda'
alias resource='vim ~/.bashrc && source ~/.bashrc'
alias eopen='encfs -o nonempty ~/Downloads/.hidden ~/Downloads/visible && cd ~/Downloads/visible'
alias eclose='cd ~/Downloads && fusermount -u visible && cd ~/'
alias worldly='echo "hello,$1"'
alias lock='xtrlock'
fuzz() {
    # vim $(fzf -q $@)
    vim $(fzf)
}
alias abii='ssh -i ~/.ssh/vanrobo pi@192.168.42.1'
alias farbii='ssh -i ~/.ssh/vanrobo pi@10.47.110.164'
alias findIP='curl -4 https://icanhazip.com/'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias radSync='rsync -Privt build/ pi@192.168.42.1:react_management_frontend/build/'
alias bradSync='rsync -Privt build/ pi@192.168.42.1:carrot-react/build/'
alias cadSync='rsync -Privt build/ pi@10.47.110.164:carrot-react/build/'
alias zradSync='rsync -Privt build/ pi@10.47.109.150:react_management_frontend/build/'
alias gotoBar='vim /Users/eamon/jWork/abii/imgOfAbii/pi/react_management_frontend/src/components/TeacherDashboard/LearnerRow.js'
#sudo netstat -lpn
