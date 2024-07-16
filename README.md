dotfiles - requires [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) and [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html#Introduction)

+ Download
`git clone --recurse-submodules https://github.com/bijumon/dotfiles.git`

+ Install
``` shell
> man stow
> stow --dotfiles -v -t ~ bash ssh tmux
```

- [tmux](https://github.com/tmux/tmux/wiki)
- [Xresources](https://github.com/bijumon/dotfiles/blob/main/Xorg/.Xresources)
  * [rxvt-unicode](https://github.com/bijumon/dotfiles/blob/main/Xorg/.Xresources)

