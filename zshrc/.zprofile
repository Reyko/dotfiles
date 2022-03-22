eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(rbenv init -)"

if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi

export GOPATH=$HOME/go-workspace # don't forget to change your path correctly!
# export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
