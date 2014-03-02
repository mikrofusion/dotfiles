export LANG="en_US.UTF-8"

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\w\[\033[36m\]\$(parse_git_branch)\[\033[00m\] $ "

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

#test runner
alias vim_test_runner='ruby ~/.vim/bundle/vim_test_runner/test_runner'
# RVM
if [[ -s "$HOME/.rvm/scripts/rvm" ]]; then . "$HOME/.rvm/scripts/rvm"; fi
alias rspec="bundle exec rspec"
