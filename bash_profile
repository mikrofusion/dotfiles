export LANG="en_US.UTF-8"

function set_prompt {
  local GRAY="\[\033[1;30m\]"
  local LIGHT_GRAY="\[\033[0;37m\]"
  local CYAN="\[\033[0;36m\]"
  local LIGHT_CYAN="\[\033[1;36m\]"
  local NO_COLOUR="\[\033[0m\]"
  local AQUA="\[\033[36m\]"
  local BLACK="\[\033[0;30m\]"
  local BLACKBOLD="\[\033[1;30m\]"
  local RED="\[\033[0;31m\]"
  local REDBOLD="\[\033[1;31m\]"
  local GREEN="\[\033[0;32m\]"
  local GREENBOLD="\[\033[1;32m\]"
  local YELLOW="\[\033[0;33m\]"
  local YELLOWBOLD="\[\033[1;33m\]"
  local BLUE="\[\033[0;34m\]"
  local BLUEBOLD="\[\033[1;34m\]"
  local PURPLE="\[\033[0;35m\]"
  local PURPLEBOLD="\[\033[1;35m\]"
  local CYAN="\[\033[0;36m\]"
  local CYANBOLD="\[\033[1;36m\]"
  local WHITE="\[\033[0;37m\]"
  local WHITEBOLD="\[\033[1;37m\]"

  export PS1="$CYAN ╭─ $WHITE\w$GREEN \$(parse_git_branch) $CYAN \n ╰─> $WHITE"
  export PATH=~/bin:/usr/local/bin:$PATH
}


# Git branch in prompt.
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

set_prompt
#
# Macports installer addition
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

# rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

#alias tmux="TERM=screen-256color-bce tmux"
export TERM=screen-256color-bce

#git autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# use mvim inplace of vim (better integration with mac)
alias vi='mvim -v' 
alias vim='mvim -v'
export EDITOR='vim'
set -o vi

# GIT helpers
alias gf='cat ~/.bash_files/git_flow'
alias gst='git status'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias grs='git reset --hard'
alias grb='git rebase -i'
alias gpo='git push origin'
alias gpfo='git push -f origin'
alias gm='git merge --no-ff'
alias gd='git diff'
alias ga='git add'
alias gau='git add --update'
alias gc='git commit -v -m'
alias gca='git commit -v -m -a'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcot='git checkout -t'
alias gcotb='git checkout --track -b'
alias glog='git log'
alias glogp='git log --pretty=format:"%h %s" --graph'
alias gl='git log --color --graph --pretty=format:"Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

alias ber='bundle exec rake'
alias bergj='bundle exec rake guard:jasmine'

#test runner
alias vim_test_runner='ruby ~/.vim/bundle/vim_test_runner/test_runner'
# RVM
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then . "$HOME/.rvm/scripts/rvm"; fi
alias rspec="bundle exec rspec"


# disable XON/XOFF flow control (hitting ctrl-s can cause this)
# stty -ixon
#

export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
