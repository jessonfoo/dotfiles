#!/bin/sh

if [ ! -d "$HOME/.gzn" ]; then
    platform='unknown'
    unamestr=$(uname)
    pkgctl='brew'
    if [[ $unamestr == 'Linux' ]]; then
      platform='linux'
        if [ -n "$(command -v yum)" ]; then
            pkgctl='yum'
        fi
        if [ -n "$(command -v apt-get)" ]; then
            pkgctl='apt-get'
        fi

        $pkgctl update -y;

        hash git 2>/dev/null || { printf >&2 "unable to find git \n attempting to install with $pkgctl \n \n "; sudo $pkgctl install git; }
        hash ruby 2>/dev/null || { printf >&2 "unable to find ruby \n attempting to install ruby with $pkgctl \n \n"; sudo $pkgctl install ruby; }
        hash rake 2>/dev/null || { printf >&2 "unable to find rake \n attempting to install rake\n \n"; gem install rake; }

    elif [[ $unamestr == 'Darwin' ]]; then
      platform='darwin'
        # check if homebrew is installed
        curl -sSL https://get.rvm.io | bash -s stable --with-default-gems="rails rake irb pry";
        which -s brew
        if [[ $? != 0 ]]; then
            # Install Homebrew from source https://brew.shk/
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        else
            brew update
        fi

        which -s git
        if [[ $? != 0 ]]; then
            brew install git
        else
            brew update
        fi

        which -s ruby
        if [[ $? != 0 ]]; then

            printf >&2 "installing ruby";
            brew install ruby;
            printf >&2 "installing rake";
            gem install rake;
        else
            which -s rake;
            if [[ $? != 0 ]]; then
                gem install ruby;
            else
                printf >&2 "all good";
            fi
        fi

    fi


    echo "Installing jesson's dot files to .gzn"
    git clone --depth=1 https://github.com/jessonfoo/dotfiles.git "$HOME/.gzn"
    cd "$HOME/.gzn"
    [ "$1" = "ask" ] && export ASK="true"
    rake install
else
    echo "the directory .gzn already exists, to install or update cd ~/.gzn && rake update"
fi
