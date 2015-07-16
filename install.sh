#!/bin/sh

if [ ! -d "$HOME/.gzn" ]; then
    echo "Installing gzn from jesson's dotfiles"
    git clone https://github.com/jessonfoo/dotfiles.git "$HOME/.gzn"
    cd "$HOME/.gzn"
    [ "$1" = "ask" ] && export ASK="true"
    rake install
else
    echo "gzn directory already exists"
fi
