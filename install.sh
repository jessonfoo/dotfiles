#!/bin/sh

if [ ! -d "$HOME/.gzn" ]; then
    platform='unknown'
    unamestr=$(uname)
    if [[ $unamestr == 'Linux' ]]; then
      platform='linux'
      hash brew 2>/dev/null || { printf >&2 "installing linuxbrew for package management \n \n ";sudo apt-get update; sudo apt-get install linuxbrew-wrapper;}
      hash git 2>/dev/null || { printf >&2 "unable to find git \n attempting to install with brew \n \n "; brew install git;}
      hash rake 2>/dev/null || { printf >&2 "unable to find rake \n attempting to install brew \n \n"; brew install rake;}
    elif [[ $unamestr == 'Darwin' ]]; then
      platform='darwin'
      hash git 2>/dev/null || { printf >&2 "unable to find git \n attempting to install with brew \n \n "; brew install git;}
      hash rake 2>/dev/null || { printf >&2 "unable to find rake \n attempting to install brew \n \n"; brew install rake;}
    fi


    echo "Installing jesson's dot files to .gzn"
    git clone --depth=1 https://github.com/jessonfoo/dotfiles.git "$HOME/.gzn"
    cd "$HOME/.gzn"
    [ "$1" = "ask" ] && export ASK="true"
    rake install
else
    echo "the directory .gzn already exists, to install or update cd ~/.gzn && rake update"
fi
