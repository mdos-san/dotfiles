#!/bin/bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load custom aliases if present
if [ -f ~/custom.bash ]; then
    . ~/custom.bash
fi

# Load path file if present
if [ -f ~/path.bash ]; then
    . ~/path.bash
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

alias gl="git log --oneline --no-decorate origin/master.."
alias gpf="git push --force origin"
alias gro="git rebase origin/master -i --autosquash"
alias grc="git rebase --continue"
alias gfa="git fetch --all"

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

export PATH=$PATH:~/nvim/bin
