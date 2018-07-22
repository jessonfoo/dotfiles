#Load themes from gzn and from user's custom prompts (themes) in ~/.zsh.prompts
autoload promptinit
fpath=($HOME/.gzn/zsh/prezto-themes $HOME/.zsh.prompts $fpath)
promptinit
