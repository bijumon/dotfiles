#!/bin/sh

declare -a files=(vimrc gvimrc gitconfig zshrc)

function link {
    echo "linking ..."
    for f in ${files[*]}; do
        echo "$PWD/_$f => $HOME/.$f"
        ln -sf $PWD/_$f $HOME/.$f
    done
    echo
    
    echo "linking vim pathogen and bundles to $HOME/.vim/"
    mkdir -p $HOME/.vim/tmp 
    mkdir -p $HOME/.vim/bundle
    ln -sf $PWD/vim-pathogen/autoload $HOME/.vim/autoload
    ln -sf $PWD/vim-sensible $HOME/.vim/bundle/
    ln -sf $PWD/vim-colors-solarized $HOME/.vim/bundle/
}

function delink {
    echo "unlinking ..."
    for f in ${files[*]}; do
        echo "$HOME/.$f"
        rm -f $HOME/.$f
    done
    rm -rf ~/.vim
}

if [ "$1" == "link" ]
then
    link
elif [ "$1" == "clean" ]
then
    delink
else
    echo "dotlink link|clean"
fi
