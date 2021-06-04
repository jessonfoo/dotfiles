#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export gzn="$HOME/.gzn"
# Customize to your needs...
for config_file ($HOME/.gzn/zsh/*.zsh) source $config_file

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="/usr/local/opt/openjdk/bin:$PATH"
# The following lines were added by compinstall

zstyle ':completion:*:argument' auto-description '%d -ifile'
zstyle ':completion:*:argument' format '%d'
zstyle ':completion:*:argument' group-name ''
zstyle ':completion:*:argument' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:argument' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*:argument' use-compctl false
zstyle ':completion:*:argument' verbose true
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
