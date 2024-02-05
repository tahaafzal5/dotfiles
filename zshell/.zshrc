# The Z Shell Manual: https://zsh.sourceforge.io/Doc/Release/

autoload -Uz compinit && compinit

export PATH="/opt/homebrew/bin:$PATH"

export CLICOLOR=1
autoload -U colors && colors

PS1="%{$fg[green]%}%n@%m/%1d $ %{$reset_color%}% "

alias ll="ls -alihp"
alias la="ls -A"
alias gk="gitk"
alias gg="git gui"
alias fd="fdfind"

