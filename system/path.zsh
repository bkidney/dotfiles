if [[ $IS_MAC ]]; then
    export PATH="$PATH:/usr/local/bin"
fi

export PATH="$ZSH/bin:$PATH"
export PATH="$HOME/bin:$PATH"

export MANPATH="/usr/local/man:/usr/local/git/man:$MANPATH"
