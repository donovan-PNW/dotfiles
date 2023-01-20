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
force_color_prompt=yes

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
# unset color_prompt force_color_prompt

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
alias ll='ls -lFh'
alias la='ls -AlFh'
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

# NVM makes bash take forever to load so I got rid of it
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# enable gpg's tui
GPG_TTY=$(tty)
export GPG_TTY

# In .bash_profile
#virtualenvwrapper
# if [ -f ~/.local/bin/virtualenvwrapper.sh ] ; then
#     export WORKON_HOME=~/.virtualenvs
#     export PROJECT_HOME=$HOME/Devel
#     export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
#     export VIRTUALENVWRAPPER_VIRTUALENV=~ /.local/bin/virtualenv
#     source /usr/local/bin/virtualenvwrapper.sh
# fi

# ===============ALIASES=============== #

# BASH filesystem
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -vn'
set -o noclobber
alias sudo='sudo '
set -o vi # VIM KEYMAPPINGS!

# De-annoyance and quick-rename aliases
alias pip='pip3'
alias python='python3'
alias top='htop'
alias sqlite='sqlite3'
alias resource='vim ~/.bashrc && source ~/.bash_profile'
alias swapThis='find . -type f -name "*.swp" -exec rm -f {} \;'
alias esad='killall -9'

fuzz() {
    FILE=$(fzf)
    if [[ $FILE ]]; then
        echo $FILE
        vim $FILE
    fi
}

lint() {
    if [[ $FILE ]]; then
        echo $FILE
        vim $FILE
    fi
}

worldly() {
    echo 'hello,' $@'! good to see you!'
}
alias ..='cd ../'
alias ...='cd ../..'
alias ....='cd ../../..'

bind "$(bind -s | grep '^"\\C-r"' | sed 's/"/"\\C-x/' | sed 's/"$/\\C-m"/')"


# Old linux aliases
alias pacman='sudo apt update && sudo apt upgrade -y ; sudo apt autoremove -y; beep ; sudo vim /etc/systemd/logind.conf'
alias Vuze='cd /media/myUsername/Dingo\ Starr/Downloads/Vuze\ Downloads'
alias beep='paplay /usr/share/sounds/ubuntu/notifications/Positive.ogg'
alias eopen='encfs -o nonempty ~/Downloads/.hidden ~/Downloads/visible && cd ~/Downloads/visible'
alias eclose='cd ~/Downloads && fusermount -u visible && cd ~/'
alias lock='xtrlock'

# nifty tricks
alias weather='curl wttr.in/portland?u'
alias mycal='gcalcli calm ; sleep 5; gcalcli agenda'
alias startup='curl wttr.in/portland?u; sleep 5; gcalcli calw now 4 ; sleep 5 ; gcalcli agenda'
alias macBeep='afplay /System/Library/Sounds/Sosumi.aiff'
alias veena='say -v Veena Hi I am veena how is your day today?'
# rg -p --color always console.log | less -R
zap() {
    rg -p --color always "$@" | less -RX
}

bush() {
    tree -C $@ | less -RX
}

grip() {
    # cut -d':' -f 1
    # Integration with ripgrep
    RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
    INITIAL_QUERY="$@"
    FZF_DEFAULT_COMMAND="$RG_PREFIX '$INITIAL_QUERY'" \
        fzf --bind "change:reload:$RG_PREFIX {q} || true" \
        --ansi --disabled --query "$INITIAL_QUERY"
}

zoop() {
    FILE=$(grip)
    vfname=$(echo $FILE | cut -d':' -f 1)
    vfline=$(echo $FILE | cut -d':' -f 2)
    FILE=${vfname} # for lint()
    # vimcmd="vim ${vfname} +${vfline}"
    # echo $vimcmd
    # exec $vimcmd
    if [[ $vfname ]]; then
        vim $vfname +$vfline
    fi
}

stripSound() {
    input_file="$1"
    output_file="$2"
    ffmpeg -i "$input_file" -c copy -an $output_file
}

gosh() {
    false
    while [ $? -ne 0 ]; do
        ssh "$@" || (sleep 1;false)
    done
}

portScan() {
    rm -rf ports.txt
    for i in {1..65535}
    do
        nc -G 5 -v -z portquiz.net $i 2>&1 >> /dev/null
    done
}

# SSH/NETWORK stuff
alias findIP='curl -4 https://icanhazip.com/'
alias raspi='ssh pi@raspberrypi.local -p 5678'
alias farpi='ssh pi@76.115.210.216 -p 5678'
alias abii='ssh -i ~/.ssh/vanrobo pi@192.168.42.1'
alias farbii='ssh -i ~/.ssh/vanrobo pi@192.168.1.10'
# alias amazon='ssh -i .ssh/Administrator-AWS-key-pair-Oregon.pem Ubuntu@ec2-34-212-34-40.us-west-2.compute.amazonaws.com'
alias amazon='ssh -i ~/.ssh/Administrator-AWS-key-pair-Oregon.pem ubuntu@ec2-34-221-223-23.us-west-2.compute.amazonaws.com'
# alias warp='sudo arp-scan 192.168.1.0/24'
alias warp='sudo arp-scan -l' 

# Hacky Shortcuts that I should delete someday
alias radSync='rsync -Privt build/ pi@192.168.42.1:react_management_frontend/build/'
alias bradSync='rsync -Privt ./build/ pi@192.168.7.124:marii_frontend/build/'
# alias bradSync='rsync -Privt ./build/ pi@192.168.42.1:marii_frontend/build/'
alias cadSync='rsync -Privt ./db.sqlite3 pi@192.168.1.4:marii_backend/db.sqlite3'
# alias zradSync='rsync -Privt build/ pi@10.47.109.150:react_management_frontend/build/'
alias vansible='cd ~/jWork/vansible && vim process-marii.yml && ansible-playbook -i hosts process-marii.yml -vv'
alias gotoBar='vim /Users/eamon/jWork/abii/imgOfAbii/pi/react_management_frontend/src/components/TeacherDashboard/LearnerRow.js'
alias gotoWav='cd ~/jWork/abii/imgOfAbii/pi/comm_abii_development/hulk/LessonController/lesson_provider/templates/static/audio'
alias GotoHulk='cd ~/jWork/abii/imgOfAbii/pi/comm_abii_development/hulk'
alias gotoLessonHandler='vim /Users/eamon/jWork/abii/imgOfAbii/pi/comm_abii_development/hulk/LessonController/lesson_provider/comms/views/lessonhandler.py'
alias facebookToggle='sudo vim /etc/hosts && dscacheutil -flushcache'
alias gotoNginx='cd /usr/local/etc/nginx/'
alias gotoAbii='cd ~/jWork/abii/imgOfAbii/pi/comm_abii_development/hulk/'
alias procesSSH='ssh -i ~/.ssh/process_backend_deploy.pem ubuntu@ec2-3-88-145-183.compute-1.amazonaws.com'
alias sleepless="pmset -g assertions | egrep '(PreventUserIdleSystemSleep|PreventUserIdleDisplaySleep)'"
# alias activate='source bin/activate'
alias pyserve='python3 -m http.server 9999'
# istats
alias copyrec='find . -iname *.mp4 -exec cp {} ./movs \;'
alias bring='youtube-dl --external-downloader axel --external-downloader-args "-n 10 -a"'
alias rorobo='git push vanrobo robot_port:master'
alias totalLines='find . -type f -exec cat {} + | wc -w'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
alias toTheCloud='ssh -i ~/.ssh/id_rsa.pub -p 80 abii-update.abiis-world.com'
alias tempGetIt='scp -i ~/.ssh/id_rsa.pub -P 80 abii-update.abiis-world.com:/home/azureuser/ansible/abii_sync.yml ~'
alias rat='find . -type f -exec bat {} \;'
alias virtual='ssh -p 1111 eamon@localhost'
alias squareCI='circleci local execute --job deploy'
alias getMd5='find . -type f ! -path "./.git/*" ! -name "checksums.txt" -exec md5 -r "{}" + | sort'
alias oldest='ls -haltr'
alias unchangedFiles='git diff --name-only --stat @{2.weeks.ago} >> changed.txt && git ls-files >> all.txt && comm -23 all.txt changed.txt >> unchanged.txt'
alias vboxUp='nohup VirtualBoxVM --startvm MARii\ Clone &'
alias nike='npm run build && rsync -avzhi /Users/eamon/jWork/abii/imgOfAbii/pi/react_management_frontend/build/ abii:~/react_management_frontend/build/'
alias sendit='rsync -avzhi /Users/eamon/jWork/abii/imgOfAbii/pi/cloud_sync_siam/wifi_controller/ abii:~/cloud_sync_siam/wifi_controller/; ssh -t abii "~/bork.sh"'
alias sendit42='rsync -avzhi /Users/eamon/jWork/abii/imgOfAbii/pi/cloud_sync_siam/wifi_controller/ abii42:~/cloud_sync_siam/wifi_controller/; ssh -t abii42 "~/bork.sh"'
alias vlc='/Applications/VLC.app/Contents/MacOS/VLC'
alias pushups="rsync -avzhi --exclude '.git' /Users/eamon/jWork/abii/imgOfAbii/pi/update_procedure/ abii:~/update_procedure/"
alias fzf="find . | fzf" # include hidden/dotfiles
alias convertHEIC='magick mogrify -monitor -format jpg *.HEIC'
alias relocate='sudo /usr/libexec/locate.updatedb'
alias seedcloud='cd ~/jWork/abii/cloud/comm_management_backend && source .env && workon 3.8_comm_mgmt'
# alias cd="pushd > /dev/null"

# sudo arp-scan -l | grep Shenzhen | awk '{print }'
# [[ $- = *i* ]] && bind TAB:menu-complete
