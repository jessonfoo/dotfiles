#!/bin/sh

if [ ! -d "$HOME/.gzn" ]; then
	platform='unknown'
	unamestr=$(uname)
	if [[ $unamestr == 'Linux' ]]; then
		platform='linux'
		pkgmgr='unknown'
		ag='apt-get'
		declare -A osInfo;
		osInfo[/etc/redhat-release]=yum
		osInfo[/etc/arch-release]=pacman
		osInfo[/etc/gentoo-release]=emerge
		osInfo[/etc/SuSE-release]=zypp
		osInfo[/etc/debian_version]=apt-get
		for f in ${!osInfo[@]}; do
			if [ -f $f ];then ag=${osInfo[$f]}; fi
		done;
		declare -A pkgs;
		pkgs[git]=git
		pkgs[ruby]=ruby
		pkgs[rake]=rake
		pkgs[zsh]=zsh
		pkgs[vim]=vim
		pkgs[lnav]=lnav
		pkgs[htop]=htop
		pkgs[tree]=tree
		for i in ${pkgs[@]}; do
			
			if ! [ -x "$(command -v $i)" ]; then
				sudo ${osInfo[$f]} install -y  $i
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
	fi
	
	echo "Installing jesson's dot files to .gzn"
	git clone --depth=1 https://github.com/jessonfoo/dotfiles.git "$HOME/.gzn"
	gzn="$HOME/.gzn"
	cd $gzn
	rake install
else
	echo "the directory .gzn already exists, to install or update cd ~/.gzn && rake update"
fi
