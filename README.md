# My .dotfiles

Config files for ZSH, Ruby, Go, Terminals and more.

## install

Run this:

```console
git clone https://github.com/chussenot/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/bootstrap
chsh -s $(which zsh)
```

This will symlink the appropriate files in `.dotfiles` to your home directory.
Everything is configured and tweaked within `~/.dotfiles`.

## hierarchy

There's a few special files in the hierarchy.

- **bin/**: Anything in `bin/` will get added to your `$PATH` and be made
  available everywhere.
- **Brewfile**: This is a list of applications for
  [Homebrew Cask](http://caskroom.io) to install: things like Chrome and
  Spotify and Atom and stuff. Might want to edit this file before running
  any initial setup.
- **topic/\*.zsh**: Any files ending in `.zsh` get loaded into your
  environment.
- **topic/path.zsh**: Any file named `path.zsh` is loaded first and is
  expected to setup `$PATH` or similar.
- **topic/completion.zsh**: Any file named `completion.zsh` is loaded
  last and is expected to setup autocomplete.
- **topic/\*.symlink**: Any files ending in `*.symlink` get symlinked into
  your `$HOME`. This is so you can keep all of those versioned in your dotfiles
  but still keep those autoloaded files in your home directory. These get
  symlinked in when you run `script/bootstrap`.
- **topic/install.sh**: Any file with this name and with exec permission, will
ran at bootstrap phase.

## tmux
`cd ~ && ln -s .dotfiles/.tmux.conf`

## thanks

I forked caarlos0 [dotfiles](https://github.com/caarlos0/dotfiles)
