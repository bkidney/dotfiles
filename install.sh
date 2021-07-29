#!/bin/sh

HOSTNAME=$(hostname -s)
# HOSTNAME=craptop
PWD=$(pwd)

TARGETS=$(find $PWD -path $PWD/.git -prune -o -name "*.symlink" -print | grep -v /host-specific/)
HOST_TARGETS=$(find $PWD -name "*.symlink" -print | grep /host-specific/${HOSTNAME}/)

help() {
    echo "Usage: $0 command"
    echo ""
    echo "Commands:"
    echo "  install - Link your dotfiles"
    echo "  uninstall - Unlink your dotfiles"
    echo "  help - Display this message"
}

make_symlink() {
    SOURCE=$1
    DEST="${HOME}/.$(basename ${SOURCE} .symlink | tr @ /)"

    if [ ! -d $(dirname $DEST) ]; then
        echo mkdir -p $(dirname $DEST)
    fi

    if [ -e $DEST ]; then
        oldsource=$(readlink $DEST)
        if [ "$oldsource" = "$SOURCE" ]; then
            return
        elif [ -L $DEST ]; then
            rm $DEST
        else
            if [ -z "$skip_all" -a -z "$backup_all" -a -z "$overwrite_all" ]; then
                do_prompt $DEST
            fi

            if [ -n "$skip" -o -n "$skip_all" ]; then
                return
            elif [ -n "$backup" -o -n "$backup_all" ]; then
                mv $DEST ${DEST}.backup
            elif [ -n "$overwrite" -o -n "$overwrite_all" ]; then
                rm -rf $DEST
            fi
        fi
    fi
    ln -s $SOURCE $DEST
}

remove_symlink() {
    SOURCE=$1
    DEST="${HOME}/.$(basename ${SOURCE} .symlink | tr @ /)"

    if [ -L $DEST ]; then
        rm $DEST

        if [ -e $DEST.backup ]; then
            mv $DEST.backup $DEST
        fi
    fi
}

install() {
    for target in $TARGETS $HOST_TARGETS; do
        make_symlink $target
    done
}

uninstall() {
    for target in $TARGETS $HOST_TARGETS; do
        remove_symlink $target
    done
}

do_prompt() {
    DEST=$1

    echo "File already exists: ${DEST}, what do you want to do? [s]kip, [S]kip all, [o]verwrite, [O]verwrite all, [b]ackup, [B]ackup all"
    char=""

    skip=""
    overwrite=""
    backup=""

    while [ -z $char ]; do
        read char
        case "$char" in
            "s")
                skip=true
                ;;
            "S")
                skip_all=true
                ;;
            "o")
                overwrite=true
                ;;
            "O")
                overwrite_all=true
                ;;
            "b")
                backup=true
                ;;
            "B")
                backup_all=true
                ;;
            *) 
                char=""
                ;;
        esac
    done
}

case "$1" in
    "install")
        install
        ;;
    "uninstall")
        uninstall
        ;;
    *)
        help
        ;;
esac
