#!/bin/bash
declare -A deps;

deps=(git, ruby, rake, vim, fontconfig, tmux, tree, htop, lnav)
if [ ! -d "$HOME/.gzn" ]; then
	platform='unknown'
	unamestr=$(uname)
	if [[ $unamestr == 'Linux' ]]; then
		platform='linux'
		
		local pkgmgr='unknown'
		declare -A osInfo;
		osInfo[/etc/redhat-release]=yum
		osInfo[/etc/arch-release]=pacman
		osInfo[/etc/gentoo-release]=emerge
		osInfo[/etc/SuSE-release]=zypp
		osInfo[/etc/debian_version]=apt-get
		for f in ${!osInfo[@]}			
		do
			if [ -f $f ];then
				brew = ${osInfo[$f]};
				alias brew = ${osInfo[$f]};
			fi
		done
		
		
	elif [[ $unamestr == 'Darwin' ]]; then
		platform='darwin'
		which -s brew
		if [[ $? != 0 ]]; then
			/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		else
			brew upgrade && brew upgrade && brew cleanup && brew prune && brew doctor
			brew install macvim
		fi
	fi
	
		
	if [ -d $pkgmgr ]; then
		for $m in "${deps[@]}"
		do				
			hash $m 2> /dev/null || ({printf >&2 "unable to find $m \n attempting to install with $pkgmgr \n \n "} && brew install -y $m)	
		done
	fi
	
if
	echo "Installing jesson's dot files to .gzn"
	git clone --depth=1 https://github.com/jessonfoo/dotfiles.git "$HOME/.gzn"
	gzn="$HOME/.gzn"
	cd $gzn
	[ "$1" = "ask" ] && export ASK="true"
	rake install
else
	echo "the directory .gzn already exists, to install or update cd ~/.gzn && rake update"
fi
	
