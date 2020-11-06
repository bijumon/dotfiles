dotfiles - requires [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) and [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html#Introduction)

+ Download
`git clone --recurse-submodules https://github.com/bijumon/dotfiles.git`

+ Install
``` shell
% man stow
% stow -v -t ~ XDG_TMP bash emacs tmux vim pathogen-vim Xorg
```

- bash
  * [prompt with updating timer](https://redandblack.io/blog/2020/bash-prompt-with-updating-time/) via [Useful shell prompt | Lobste.rs](https://lobste.rs/s/s5jj3v/useful_shell_prompt)
  * [Taskwarrior](https://taskwarrior.org/docs/start.html)
  * bash_aliases
  * [save history without exit](https://superuser.com/questions/555310/bash-save-history-without-exit)
  * `λ` unicode prompt (U+03BB)
- Emacs
 * [doom-emacs - getting started](https://github.com/hlissner/doom-emacs/blob/develop/docs/getting_started.org)
- Vim
  * [pathogen.vim: manage your runtimepath](https://github.com/tpope/vim-pathogen)
  * [sensible.vim: Defaults everyone can agree on](https://github.com/tpope/vim-sensible)
  * [surround.vim: quoting/parenthesizing made simple](https://github.com/tpope/vim-surround)
  * [solarized: precision colorscheme](https://github.com/altercation/vim-colors-solarized)
- [tmux](https://github.com/tmux/tmux/wiki)
- [Xresources](https://github.com/bijumon/dotfiles/blob/main/Xorg/.Xresources)
  * [rxvt-unicode](https://github.com/bijumon/dotfiles/blob/main/Xorg/.Xresources)
- [tilix](https://github.com/gnunn1/tilix/)
``` shell 
% dconf dump /com/gexperts/Tilix/ > tilix/default-profile.dconf

% dconf reset -f /com/gexperts/Terminix/

% dconf load /com/gexperts/Tilix/ < tilix/default-profile.dconf
```
