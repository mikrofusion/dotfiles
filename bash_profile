export LANG="en_US.UTF-8"

 GRAY="\[\033[1;30m\]"
 LIGHT_GRAY="\[\033[0;37m\]"
 CYAN="\[\033[0;36m\]"
 LIGHT_CYAN="\[\033[1;36m\]"
 NO_COLOUR="\[\033[0m\]"
 AQUA="\[\033[36m\]"
 BLACK="\[\033[0;30m\]"
 BLACKBOLD="\[\033[1;30m\]"
 RED="\[\033[0;31m\]"
 REDBOLD="\[\033[1;31m\]"
 GREEN="\[\033[0;32m\]"
 GREENBOLD="\[\033[1;32m\]"
 YELLOW="\[\033[0;33m\]"
 YELLOWBOLD="\[\033[1;33m\]"
 BLUE="\[\033[0;34m\]"
 BLUEBOLD="\[\033[1;34m\]"
 PURPLE="\[\033[0;35m\]"
 PURPLEBOLD="\[\033[1;35m\]"
 CYAN="\[\033[0;36m\]"
 CYANBOLD="\[\033[1;36m\]"
 WHITE="\[\033[0;37m\]"
 WHITEBOLD="\[\033[1;37m\]"
function set_prompt {

   # Bold
  #BoldGreen="\[\033[1;32m\]"    # Green
  #BoldBlue="\[\033[1;34m\]"     # Blue

  # High Intensty
  #IntenseBlack="\[\033[0;90m\]" # Grey

  # Bold High Intensty
  #Magenta="\[\033[1;95m\]"      # Purple

  # Regular Colors
  #Yellow="\[\033[0;33m\]"
  #White='\[\033[37m\]'
  #Red="\[\033[0;31m\]"
  #local Blue="\[\033[0;34m\]"
  #Cyan="\[\033[0;36m\]"

  GIT_PROMPT_PREFIX="["
  GIT_PROMPT_SUFFIX="]"
  GIT_PROMPT_SEPARATOR="|"
  GIT_PROMPT_BRANCH="${Magenta}"
  GIT_PROMPT_STAGED="●"
  GIT_PROMPT_CONFLICTS="${Red}✖"
  GIT_PROMPT_CHANGED="✚"
  GIT_PROMPT_REMOTE=" "
  GIT_PROMPT_UNTRACKED="…"
  GIT_PROMPT_STASHED="${BoldBlue}⚑"
  GIT_PROMPT_CLEAN="✔"

  function start {
    echo "╭─"
  }

  function end {
    echo "╰─>"
  }

  export PS1="$CYAN$(first) $WHITE\w$GREEN \$(parse_git_branch) $CYAN \n$(end) $WHITE"
  export PATH=~/bin:/usr/local/bin:$PATH
}

# Git branch in prompt.
function parse_git_dirty {
  count_lines() { echo "$1" | egrep -c "^$2" ; }
  all_lines() { echo "$1" | grep -v "^$" | wc -l ; }

  gitstatus=`git diff --name-status 2>&1`
  staged_files=`git diff --staged --name-status`

  num_changed=$(( `all_lines "$gitstatus"` - `count_lines "$gitstatus" U` ))
  num_conflicts=`count_lines "$staged_files" U`
  num_staged=$(( `all_lines "$staged_files"` - num_conflicts ))
  num_untracked=`git status -s -uall | grep -c "^??"`

  result=''

  # [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]]; then

  if [[ $num_changed > 0 ]]; then
    result="${num_changed}$GIT_PROMPT_CHANGED"
  fi

  if [[ $num_staged > 0 ]]; then
    result="$result ${num_staged}$GIT_PROMPT_STAGED"
  fi

  if [[ $num_untracked > 0 ]]; then
    result="$result $GIT_PROMPT_UNTRACKED"
  fi

  if [[ $result == '' ]]; then
    echo $GIT_PROMPT_CLEAN
  fi

  echo $result
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$GIT_PROMPT_SEPARATOR$(parse_git_dirty)]/"
}

#export PS1="$CYAN ╭─ $WHITE\w$GREEN\$(parse_git_branch)$CYAN \n ╰─> $WHITE"
export GIT_PROMPT_START="$CYAN ╭─ $WHITE\w"
export GIT_PROMPT_END="$CYAN \n ╰─> $WHITE"

source ~/dotfiles/bash_files/bash-git-prompt/gitprompt.sh

#set_prompt
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
