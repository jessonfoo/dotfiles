# Laravel5 basic command completion
_laravel5_get_command_list () {
	php artisan --no-ansi | sed "1,/Available commands/d" | awk '/^ +[a-z]+/ { print $1 }'
}

_laravel5 () {
  if [ -f artisan ]; then
    compadd `_laravel5_get_command_list`
  fi
}

compdef _laravel5 artisan
compdef _laravel5 la5
compdef _laravel5 pa

#Alias
alias la5='php artisan'

alias la5cache='php artisan cache:clear'
alias la5routes='php artisan route:list'
alias la5vendor='php artisan vendor:publish'

alias pa='php artisan'

alias pacc='php artisan cache:clear'
alias parl='php artisan route:list'
alias pavp='php artisan vendor:publish'
