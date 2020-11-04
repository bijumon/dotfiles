alias ls="/usr/bin/ls --color -Fhl"
alias cp="cp -i"
alias rm="rm -i"

alias df="df -h"
alias du="du -h"

alias free="free -m"
alias tmux="/usr/bin/tmux -2"

# git aliases
alias tgb="git branch"
alias tgd="git diff"
alias tgs="git status"

# emacs client and server
alias est="systemctl status emacs --user"
alias ec="emacsclient -nc"
alias et="emacsclient -t"

# yay is a pacman/AUR frontend
alias pkgdb_update="yay -Syy"
alias sysupdate="yay -Su"
alias sysupdate_nc="yay -Su --noconfirm"

# ruby, bundler
alias b="bundle"
alias bi="bundle install"
alias bx="bundle exec"

# jekyll static site generator
alias j="bundle exec jekyll"
alias jc="bundle exec jekyll compose"

