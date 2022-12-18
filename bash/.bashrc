#!/bin/bash

# Load custom config if present
if [ -f ~/custom.bash ]; then
    . ~/custom.bash
fi

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

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

#######
# Git #
#######

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

function work {
  WINDOW=$(find ~/github/ -mindepth 2 -maxdepth 2 | fzf)
  tmux has-session -t workspaces
  HAS_SESSION=$?
  if [ $HAS_SESSION -eq 1 ]
  then
    tmux new-session -Ad -s workspaces -n $WINDOW -c $WINDOW
  else
    tmux new-window -ad -n $WINDOW -t workspaces: -c $WINDOW
  fi

  # Switch or Attach to the new window
  tmux switch-client -t workspaces:$WINDOW || tmux at -t workspaces \; select-window -t $WINDOW
}

function process {
  WINDOW=$(find ~/github/ -mindepth 2 -maxdepth 2 | fzf)
  tmux has-session -t processes
  HAS_SESSION=$?
  if [ $HAS_SESSION -eq 1 ]
  then
    tmux new-session -Ad -s processes -n $WINDOW -c $WINDOW
  else
    tmux new-window -ad -n $WINDOW -t processes: -c $WINDOW
  fi

  # Switch or Attach to the new window
  tmux switch-client -t processes:$WINDOW || tmux at -t processes \; select-window -t $WINDOW
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

[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

. "$HOME/.cargo/env"
