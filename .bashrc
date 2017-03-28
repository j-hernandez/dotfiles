export PATH='/usr/local/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH'
export PATH=/usr/lib/php/pear/:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Hook for desk activation
[ ! -z "$DESK_ENV" ] && source "$DESK_ENV"
