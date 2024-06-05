#!/bin/bash

export HISTCONTROL=ignorespace

# Prompt
PS1='[\u@\h \W]\$ '

# Source
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/custom.bash ] && source ~/custom.bash

# Clean bash history
alias history_clean="history -c && history -w"

# Use color with ls
alias ls='ls --color=auto'

alias tmux="tmux -2"

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
alias gca="git commit --amend --allow-empty"
alias gd="git diff origin/master.."
alias gfa="git fetch --all"
alias gl="git log --oneline --no-decorate origin/master.."
alias glo="git log --oneline"
alias gp="git branch --show-current | xargs git push origin"
alias gpf="git branch --show-current | xargs git push --force origin"
alias grc="git rebase --continue"
alias grr="git rebase -i --root --autosquash"
alias gro="git rebase origin/master -i --autosquash"
alias gs="git status"

function gcf {
  git commit --fixup=$1
}

function gcs {
  git commit --squash=$1
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

function git-mutated-files {
  git ls-tree -r main --name-only | xargs -n 1 bash -c 'echo $0 $(git log --oneline $0 | wc -l) | grep 2'
}

function git-recommit {
  git diff --name-only --diff-filter=M | xargs -l bash -c 'git log -n 1 --pretty=format:"%h" $0 && echo "" && echo $0' | xargs -l -n 2 bash -c 'git add $1 && git commit --fixup=$0'
}

function git-recommit-deleted {
  git diff --name-only --diff-filter=D | xargs -l bash -c 'git log -n 1 --pretty=format:"%h" -- $0 && echo "" && echo $0' | xargs -l -n 2 bash -c 'git add -- $1 && git commit --fixup=$0'
}

alias todo="vim ~/todo"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
