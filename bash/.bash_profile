#!/bin/bash

set -o vi

# Source
[ -f ~/path.bash ] && source ~/path.bash
[ -f ~/custom.bash ] && source ~/custom.bash
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Path
export PATH=$PATH:/home/$USER/.local/bin
export HISTCONTROL=ignorespace

# include .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
  . "$HOME/.bashrc"
fi

# Aliases
alias rl="source ~/.bash_profile"
alias brc="nvim ~/.bash_profile"
alias history_clean="history -c && history -w"
alias k="kubectl"
alias ls='ls --color=auto'
alias peek="peek -b ffmpeg"
alias vrc="nvim ~/.config/nvim/init.lua"

# Git
alias ga="git add ."
alias gc="git commit --allow-empty"
alias gca="git commit --amend --allow-empty"
alias gd="git diff"
alias gfa="git fetch --all"
alias gl="git log --oneline"
alias glr="git log --oneline --reverse"
alias gp="git branch --show-current | xargs git push origin"
alias gpf="git branch --show-current | xargs git push --force origin"
alias grc="git rebase --continue"
alias gro="git rebase origin/master -i --autosquash"
alias grr="git rebase -i --root --autosquash"
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

function git-mutated-files {
  git ls-tree -r main --name-only | xargs -n 1 bash -c 'echo $0 $(git log --oneline $0 | wc -l) | grep 2'
}

function git-recommit {
  git diff --name-only --diff-filter=M | xargs -l bash -c 'git log -n 1 --pretty=format:"%h" $0 && echo "" && echo $0' | xargs -l -n 2 bash -c 'git add $1 && git commit --fixup=$0'
}

function git-recommit-deleted {
  git diff --name-only --diff-filter=D |
    xargs -l bash -c 'git log -n 1 --pretty=format:"%h" -- $0 && echo "" && echo $0' |
    xargs -l -n 2 bash -c 'git add -- $1 && git commit --fixup=$0'
}
