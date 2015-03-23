# .dotfiles

## Install

Clone this repository to `~/.dotfiles` and sets up symlinks.

```
$ curl https://raw.github.com/ttdonovan/dotfiles/master/install.sh | bash
```

## Update

Pull down any changes from GitHub and then sets up symlinks.

```
$ cd ~/.dotfiles
$ ./install.sh
```

Skip all git actions with `-n` flag.

```
$ ./install.sh -n
```

This is useful when used with something like a dotfiles chef recipe which handles sync'ing with git.
