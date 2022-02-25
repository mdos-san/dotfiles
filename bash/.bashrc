# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load custom aliases if present
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
alias vim="nvim"
alias tmux="tmux -2"

# Git
alias gtodo="git commit --allow-empty"
alias gl="git log --oneline --no-decorate"
alias gc="git commit --allow-empty"
alias grom="git rebase -i --autosquash origin/master"


# Java
alias spring="mvn -q spring-boot:run -Dspring-boot.run.arguments='--spring.config.location=src/main/resources/ --spring.profiles.active=log_human,local,create_indexes'"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

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
}

