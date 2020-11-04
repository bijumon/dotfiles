dotfiles - requires [git submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules) and [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html#Introduction)

+ Download
`git clone --recurse-submodules https://github.com/bijumon/dotfiles.git`

+ Install
``` shell
% man stow
% stow -v -t ~ XDG_TMP bash emacs tmux vim pathogen-vim Xorg
```

+ Software
 - bash
   * [prompt with updating timer](https://redandblack.io/blog/2020/bash-prompt-with-updating-time/) via [Useful shell prompt | Lobste.rs](https://lobste.rs/s/s5jj3v/useful_shell_prompt)
   * [Taskwarrior](https://taskwarrior.org/docs/start.html)
   * bash_aliases
   * [save history without exit](https://superuser.com/questions/555310/bash-save-history-without-exit)
   * `λ` unicode prompt (U+03BB)
 - Emacs
   * [Prelude](https://prelude.emacsredux.com/en/latest/)
 - Vim
   * pathogen
   * sensible
   * surround
   * solarized colors
 - tmux
 - Xresources
   * urxvt
