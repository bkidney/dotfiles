# My dotfiles

## dotfiles

Your dotfiles are how you personalize your system. These are mine. 

This is a modifed version of Zach Holman's dot files.  I don't use
zsh or many of the same programs as him, but I liked the way he 
handles the files. If you're interested in the philosophy behind 
his project, you might want to [read his post on the
subject](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/).

If you use zsh I suggest you go back to the
[original project](http://github.com/holman/dotfiles).

## install

- `git clone git://github.com/bkidney/dotfiles ~/.dotfiles`
- `cd ~/.dotfiles`
- `rake install`

The install rake task will symlink the appropriate files in `.dotfiles` to your
home directory. Everything is configured and tweaked within `~/.dotfiles`,
though.

The main file you'll want to change right off the bat is `bash/bashrc.symlink`,
which sets up a few paths that'll be different on your particular machine.

You'll also want to change `git/gitconfig.symlink`, which will set you up
committing as someone else. You probably don't want that.

## topical

Everything's built around topic areas. If you're adding a new area to your
forked dotfiles — say, "Java" — you can simply add a `java` directory and put
files in there. Anything with an extension of `.bash` will get automatically
included into your shell. Anything with an extension of `.symlink` will get
symlinked without extension into `$HOME` when you run `rake install`.

## what's inside

A lot of stuff. Seriously, a lot of stuff. Check them out in the file browser
above and see what components may mesh up with you. Fork it, remove what you
don't use, and build on what you do use.

## components

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **topic/\*.bash**: Any files ending in `.bash` get loaded into your
  environment.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `rake install`.
- **topic/\*.completion.sh**: Any files ending in `completion.sh` get loaded
  last so that they get loaded after we set up zsh autocomplete functions.


## bugs

I want this to work for everyone; that means when you clone it down it should
work for you. That said, I do use this as *my* dotfiles, so there's a good 
chance I may break something if I forget to make a check for a dependency.

If you're brand-new to the project and run into any blockers, please
[open an issue](https://github.com/bkidney/dotfiles/issues) on this repository
and I'd love to get it fixed for you!

## thanks

I forked [Zak Holman's](http://github.com/holman) excellent 
[dotfiles](http://github.com/holman/dotfiles). Zak Holman forked 
[Ryan Bates](http://github.com/ryanb)' excellent
[dotfiles](http://github.com/ryanb/dotfiles) for a couple years before the
weight of my changes and tweaks inspired me to finally roll his own. But Ryan's
dotfiles were an easy way to get into bash customization, and then to jump ship
to zsh a bit later. A decent amount of the code in these dotfiles stem or are
inspired from Ryan's original project.
