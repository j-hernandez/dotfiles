export PATH='/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH'
export PATH=/usr/lib/php/pear/:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export GOPATH=$HOME/golang
export PATH=$PATH:$GOPATH/bin

# Hook for desk activation
[ ! -z "$DESK_ENV" ] && source "$DESK_ENV"
