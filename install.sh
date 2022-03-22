#!/bin/bash
if [ ! -d "$HOME/.gzn" ]; then
  platform='unknown'
  unamestr=$(uname)
  if [[ $unamestr == 'Linux' ]]; then
    platform='linux'
    ag='apt-get'
    declare -A osInfo;
    osInfo[/etc/redhat-release]=yum
    osInfo[/etc/arch-release]=pacman
    osInfo[/etc/gentoo-release]=emerge
    osInfo[/etc/SuSE-release]=zypp
    osInfo[/etc/debian_version]=apt-get
    for f in ${!osInfo[@]}; do
      if [ -f $f ]; then
        ag=${osInfo[$f]};
      fi
    done;


    echo "package manager $ag";
    declare -a packages;
    packages=( git ruby rake zsh vim fontconfig tree lnav htop tree tmux )
    for i in ${packages[@]}; do

      if ! [ -x "$(command -v $i)" ]; then
        sudo $ag install -y  $i
      else
        echo "-- $i already installed ---"
      fi

    done


  elif [[ $unamestr == 'Darwin' ]]; then
    platform='darwin'
    which -s brew
    if [[ $? != 0 ]]; then
      /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
      echo "--- brew is already isntalled ---"
    fi

  echo "Installing jesson's dot files to .gzn"
  git clone --depth=1 https://github.com/jessonfoo/dotfiles.git "$HOME/.gzn"
  gzn="$HOME/.gzn"
  cd $gzn
  rake install
else
  echo "the directory .gzn already exists, to install or update cd ~/.gzn && rake update"
fi
