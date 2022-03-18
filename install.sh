#!/bin/sh

if [ ! -d "$HOME/.gzn" ]; then
    platform='unknown'
    unamestr=$(uname)
    if [[ $unamestr == 'Linux' ]]; then
      platform='linux'

      pkgmgr='unknown'
      declare -A osInfo;
      osInfo[/etc/redhat-release]=yum
      osInfo[/etc/arch-release]=pacman
      osInfo[/etc/gentoo-release]=emerge
      osInfo[/etc/SuSE-release]=zypp
      osInfo[/etc/debian_version]=apt-get
      for f in ${!osInfo[@]}
      do
        if [ -f $f ];then
          export pkgmgr=${osInfo[$f]};
      fi
  done

    #      hash brew 2>/dev/null || { printf >&2 "installing linuxbrew for package management \n \n ";sudo $pkgmgr update; sudo $pkgmgr install linuxbrew-wrapper;}
    hash git 2>/dev/null || { printf >&2 "unable to find git \n attempting to install with $pkgmgr \n \n ";
        sudo $pkgmgr install git -Y; }
    hash ruby 2>/dev/null || { printf >&2 "unable to find ruby \n attempting to install ruby with $pkgmgr \n \n";
       sudo $pkgmgr  install ruby -y; 
    }
    hash rake 2>/dev/null || { printf >&2 "unable to find rake \n attempting to install rake\n \n";
    sudo $pkgmgr install rake -Y; }
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
        # check if homebrew is installed
        which -s brew
        if [[ $? != 0 ]]; then
            # Install Homebrew from source https://brew.sh/
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
        else
            brew upgrade && brew upgrade && brew cleanup && brew prune && brew doctor
            brew install macvim
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
    gzn="$HOME/.gzn"
    cd $gzn
    [ "$1" = "ask" ] && export ASK="true"
    rake install
else
    echo "the directory .gzn already exists, to install or update cd ~/.gzn && rake update"
fi
