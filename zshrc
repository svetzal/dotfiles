# ~/.zshrc

eval "$(starship init zsh)"

export EDITOR="nvim"
bindkey -e

alias ls="ls -G --color=always"
alias less="less -R"
alias vi="nvim"
alias vim="nvim"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
