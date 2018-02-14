#!/usr/bin/env bash

nice_print() {
    local format="$1";
    shift

    printf "\n$format\n" "$@"
}

package_control_url="https://packagecontrol.io/Package%20Control.sublime-package"

nice_print "Creating Sublime directories..."

mkdir -p $HOME/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
mkdir $HOME/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages

nice_print "Installing Sublime..."

brew cask install sublime-text

nice_print "Grabbing Package Control..."

wget $package_control_url -P "$HOME/Library/Application Support/Sublime Text 3/Installed Packages"

nice_print "Copying settings file..."

cp -R settings/. "$HOME/Library/Application Support/Sublime Text 3/Packages/User/"
