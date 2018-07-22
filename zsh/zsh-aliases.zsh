# Global aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g C='| wc -l'
alias -g H='| head'
alias -g L="| less"
alias -g N="| /dev/null"
alias -g S='| sort'
alias -g G='| grep' # now you can do: ls foo G something

# Functions
#
# (f)ind by (n)ame
# usage: fn foo 
# to find all files containing 'foo' in the name
function fn() { ls **/*$1* }


# Functions
#
# (f)ind by (n)ame
# usage: fn foo 
# to find all files containing 'foo' in the name
_comp_sudo_alias() { from="$2"; COMPREPLY=()
  if [[ $COMP_CWORD == 1 ]]; then
    COMPREPLY=( "$( alias -p | grep "^ *alias $from=" | sed -r "s/^ *alias [^=]+='(.*)'$/\1/" )" )
    return 0
  fi
  return 1
}


# Functions
#
# (f)ind by (n)ame
# usage: fn foo 
# to find all files containing 'foo' in the name

sudo() { 
    if alias "$1" &> /dev/null ; then 
        $(type "$1" | sed -E 's/^.*`(.*).$/\1/') "${@:2}"
    else 
        command sudo "$@"
    fi 
}
