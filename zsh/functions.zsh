# check if the command after sudo is aliased in my file, if it is run the aliased command rather than attempting to literraly execute the alias as a command
sudo() { 
    if alias "$1" &> /dev/null ; then 
        $(type "$1" | sed -E 's/^.*`(.*).$/\1/') "${@:2}"
    else 
        command sudo "$@"
    fi 
}
