# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Load custom aliases if present
if [ -f ~/alias.bash ]; then
    . ~/alias.bash
fi

# Load custom path if present
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
alias gl="git log --oneline --no-decorate"
alias gc="git commit --allow-empty"
alias grom="git rebase -i --autosquash origin/master"
alias vim="nvim"
alias tmux="tmux -2"
alias spring="mvn -q spring-boot:run -Dspring-boot.run.arguments='--spring.config.location=src/main/resources/ --spring.profiles.active=log_human,local,create_indexes'"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

