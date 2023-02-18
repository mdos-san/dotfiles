#!/bin/bash

# Source
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/custom.bash ] && source ~/custom.bash

# Prompt
PS1='[\u@\h \W]\$ '

# Global aliases
alias ls='ls --color=auto'
alias rl="source ~/.bashrc"
alias brc="vim ~/.bashrc"
alias vrc="vim ~/.vimrc"
alias luarc="vim ~/.config/nvim/init.lua"
alias vim="nvim"
alias tmux="tmux -2"
alias peek="peek -b ffmpeg"
alias unity="UnityHub --disable-gpu-sandbox"

alias k="kubectl"

# Git
alias ga="git add ."
alias gaca="git add . && git commit --amend"
alias gc="git commit"
alias gca="git commit --amend"
alias gs="git status"
alias gfa="git fetch --all"
alias gl="git log --oneline --no-decorate origin/master.."
alias gd="git diff origin/master.."
alias gp="git branch --show-current | xargs git push origin"
alias gpf="git branch --show-current | xargs git push --force origin"
alias grc="git rebase --continue"
alias gro="git rebase origin/master -i --autosquash"

function gcf {
  git commit --fixup=$1
}

function git-changelog {
  git log --pretty="- %s" origin/master..
}

function git-todo {
  git commit --allow-empty
}

function git-plan {
  git commit --allow-empty
}

function git-save {
  git add .
  git commit --amend --no-edit
}

function port-pid {
    netstat -ltnp | grep -w ":$1"
}

function findSameBaseName {
  basename $1 | \
      cut -d '.' -f 1 | \
      xargs -I{} -n 1 find . -name *{}* -not -path *node_modules* -not -path *target* -not -path *.git* | \
      xargs realpath
}

export PATH=$PATH:~/nvim/bin
export PATH=$PATH:~/.local/bin
