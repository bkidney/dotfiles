if [[ $IS_MAC ]]; then
    export PATH="$PATH:/usr/local/bin"
fi

export PATH="$PATH;$ZSH/bin"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/Dropbox/bin:$PATH"

export MANPATH="/usr/local/man:/usr/local/git/man:$MANPATH"
