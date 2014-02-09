# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\w\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

export PATH=~/bin:/usr/local/bin:$PATH
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


