HOSTNAME = $(shell hostname -s)
PWD = $(shell pwd)
LN_FLAGS = -s

SYMLINKS = `find $(PWD) -path $(PWD)/.git -prune -o -name "*.symlink" -print | grep -v host-specific`
SYMLINKS += `find $(PWD) -name *.symlink |grep host-specific/$(HOSTNAME)`

help:
	@echo "This script is used to install and remove dotfile."
	@echo "The available targets are:"
	@echo "	help - Display this help information"
	@echo "	install - Link your dotfiles"
	@echo "	uninstall - Unlink your dotfiles"

install: 
	@for target in $(SYMLINKS); do\
		link=~/.`echo $$target | sed 's#.*/\([^/]*\).symlink#\1#'`;\
		`ln $(LN_FLAGS) $$target $$link`;\
	done;

uninstall:
	@for target in $(SYMLINKS); do\
		link=~/.`echo $$target | sed 's#.*/\([^/]*\).symlink#\1#'`;\
		[ -L $$link ] && `rm -f $$link` || true;\
	done;

.PHONY: help install uninstall
