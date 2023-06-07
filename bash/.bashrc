#!/bin/bash

# Source
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/custom.bash ] && source ~/custom.bash

export HISTCONTROL=ignorespace

# Prompt
PS1='[\u@\h \W]\$ '

# Clean bash history
alias history_clean="history -c && history -w"

# Use color with ls
alias ls='ls --color=auto'

# Reload bash configuration
alias rl="source ~/.bashrc"

# Edit bash configuration
alias brc="vim ~/.bashrc"

# Edit vim configuration
alias vrc="vim ~/.vimrc"

# Edit neovim configuration
alias nvimrc="vim ~/.config/nvim/init.lua"

# Use nvim by default
alias vim="nvim"

# Start tmux with colors
alias tmux="tmux -2"

# Start peek in ffmpeg mode
alias peek="peek -b ffmpeg"

# Start UnityHub without gpu sandbox
alias unity="UnityHub --disable-gpu-sandbox"

# Shortcut for kubectl
alias k="kubectl"

# Git
alias ga="git add ."
alias gaca="git add . && git commit --amend"
alias gc="git commit"
alias gca="git commit --amend"
alias gd="git diff origin/master.."
alias gfa="git fetch --all"
alias gl="git log --oneline --no-decorate origin/master.."
alias gp="git branch --show-current | xargs git push origin"
alias gpf="git branch --show-current | xargs git push --force origin"
alias grc="git rebase --continue"
alias gro="git rebase origin/master -i --autosquash"
alias gs="git status"

function gcf {
  git commit --fixup=$1
}

function git-changelog {
  git log --pretty="- %s" origin/master..
}

function git-todo {
  git commit --allow-empty
}

function git-save {
  git add .
  git commit --amend --no-edit
}

