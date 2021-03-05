# eval $(register-python-argcomplete ansible)
# eval $(register-python-argcomplete ansible-config)
# eval $(register-python-argcomplete ansible-console)
# eval $(register-python-argcomplete ansible-doc)
# eval $(register-python-argcomplete ansible-galaxy)
# eval $(register-python-argcomplete ansible-inventory)
# eval $(register-python-argcomplete ansible-playbook)
# eval $(register-python-argcomplete ansible-pull)
# eval $(register-python-argcomplete ansible-vault)
export GITAWAREPROMPT=~/.bash/git-aware-prompt
export PYTHONPATH=/usr/bin/python
export PYTHONDONTWRITEBYTECODE=1
source "${GITAWAREPROMPT}/main.sh"
#### NOT SURE IF WORKS:
export GIT_PS1_SHOWCOLORHINTS=true
export GIT_PS1_SHOWDIRTYSTATE=true
export GREP_OPTIONS='--color=auto'
export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
#####
# export WORKON_HOME=$HOME/.virtualenvs
# export PROJECT_HOME=$HOME/test_developers
# export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python3
# export VIRTUALENVWRAPPER_VIRTUALENV=/usr/local/bin/virtualenv
export VIRTUALENVWRAPPER_PYTHON=$(which python3)
source /usr/local/bin/virtualenvwrapper_lazy.sh
#####



test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
source ~/.bashrc
# export PS1="\u@\h \W \[\$txtcyn\]\$git_branch\[\$txtred\]\$git_dirty\[\$txtrst\]\$ "
