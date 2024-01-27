if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export PATH="/opt/homebrew/bin:$PATH"
export PATH=/Users/tahaafzal/Documents/Development/apache-maven-3.8.6/bin:$PATH

export CLICOLOR=1
# i like the commented out colors, but they are hard to distingush sometimes so I am using the
# default colors for now. adding `p` to ls adds a `/` to directories making them easier to 
# distinguish from files. Works for now.
#export LSCOLORS=CxxxbxexXxexexxxxxcxcx

alias ll='ls -alihp'
alias rm='rm -i'

export PS1="\[\e[;32m\]\h:\W \u\$ \[\e[0m\]"

