# Aliases in this file are bash and zsh compatible

#custom  aliases

alias games='/usr/share/emacs/22.1/lisp/play'

# fucking common typos lol
alias isntall='install'

# Don't change. The following determines where gzn is installed.
gzn=$HOME/.gzn

# htop
alias htop='sudo htop'
alias iftop='sudo iftop'
alias md="macdown"
# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

#lazy aliases
alias h="cd ~/"
alias phplint="git status -sb | awk '/s/{print $2}' | sed 1d | xargs -n1 php -l"
alias ehosts="sudo vim /etc/hosts"
alias l='ls -FlAGh'
alias cleartest="clear && phpunit" 
alias pubkey="/bin/cat ~/.ssh/id_rsa.pub | pbcopy"
alias name="uname -n | tee /dev/ttys001 | pbcopy"
alias vapro="curl -L http://bit.ly/vaprobash > Vagrantfile"
alias chrome="/usr/bin/open -a /Applications/Google Chrome.app"
alias lctl="launchctl"
alias catnew="sudo cat $@\"$(ls $@ -rt | tail -n1)\" | less"

# Composer
alias c='composer'
alias cc='composer config'
alias cdiag='composer diagnoe'
alias csu='composer self-update'
alias cu='composer update'
alias cr='composer require'
alias ci='composer install'
alias cs="composer status"
alias ccp='composer create-project'
alias cdu='composer dump-autoload'
alias cgu='composer global update'
alias cgr='composer global require'

# install composer in the current directory
alias cget='curl -s https://getcomposer.org/installer | php'


# backup shortcuts using mackup [pip install mackup]
alias mbackup="mackup backup"

alias apmi="apm install "
#pip stuff
alias pip="pip_pypy3"

alias lctl="launchctl"
# Lunchy commands [ for launchctl control]
alias lc='lunchy'
alias lcls='lunchy ls'
alias lcs='lunchy stop'
alias lcstart='lunchy start -w'
alias lcr='lunchy restart'
alias lcst='lunchy status'
alias lcin='lunchy install'
alias lcunin='lunchy uninstall'
alias lcshow='lunchy show'
alias lce='lunchy edit'

# kill all applications by user
alias fuckitall='sudo killall -u Jesson -m .'

# HomeBrew
alias binf="brew info "
alias bri="brew install"
alias bl="brew list"
alias brci="brew cask install"
alias brewu="brew update && brew"
if which brew >/dev/null 2>&1; then
  alias br="brew"
  alias bro="brew update && brew outdated && cask_report"
  alias brup="brew upgrade --all && brew cleanup && brew prune && rm -rf `brew --cache`/*"
  alias brc="brew cask"
  alias brci="brew cask install"
  alias bri="brew install"
  alias brs="brew search"
  alias brh="brew home"
  alias brdr="brew doctor"
fi

#Kill Background Jobs
alias kbgj="jobs -p | awk '{print $3}' | xargs kill"

# alias gssh="ssh root@159.203.254.44"
# alias USSVssh="ssh root@159.203.253.45 -o=stricthostkeychecking=no"
alias rssh="ssh -v rankerdev@10.210.132.102"
# alias ossh="ssh root@192.241.203.47 -o=stricthostkeychecking=no"
# alias jssh="ssh root@104.131.154.83 -o=stricthostkeychecking=no"
# alias gssh="ssh root@104.236.169.67 -o=stricthostkeychecking=no"
alias singleappmodeon="defaults write com.apple.dock single-app -bool TRUE; killall Dock"
alias singleappmodeoff="defaults write com.apple.dock single-app -bool FALSE; killall Dock"
alias scrollmodeon="defaults write com.apple.dock scroll-to-open -bool TRUE; killall Dock"
alias scrollmodeoff="defaults write com.apple.dock scroll-to-open -bool FALSE; killall Dock"
# run wget to download to /dev/null  (device file that discards data written but reports write success) 100mb dowload
alias st10="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
alias st100="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test100.zip"
alias st1000="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test1000.zip"

#Tmux
alias tm='tmux'
alias tlk="tmux list-keys"
alias tlc='tmux list-commands'
alias tbk='tmux bind-key'
alias ta='tmux attach -t'
alias tls='tmux ls'
alias tmk='tmux kill-server'
alias tk='tmux kill-session  -t'
alias tma="tmux attach-session -t 0"


# Coloring for ag
alias ag='ag --color=auto'
# Disk free space in GB
alias df='df -h'
#calculate total disk usage for a folder
alias du='du -h -c'


alias tcs="tmux choose-session"
alias trs="tmux rename-session -t"
alias trw="tmux rename-window -t"
# gzn suppore

alias gav='gzn vim-add-plugin'
alias gdv='gzn vim-delete-plugin'
alias glv='gzn vim-list-plugin'
alias gup='gzn update-plugins'
alias gip='gzn init-plugins'

alias dbconnect='mysql contentfactory -uapp_db -h127.0.0.1 --password=ranker_rules -A'
# PS
alias psa="ps aux"
alias psf="ps aux | ack"
alias psm="ps aux | ack mysql"
alias psr='ps aux | grep -i ruby'
alias vup="vagrant up"
alias awsv="ssh ubuntu@ec2-34-211-5-190.us-west-2.compute.amazonaws.com -v -i ~/.ssh/urbit.pem"

alias aws="ssh ubuntu@ec2-34-211-5-190.us-west-2.compute.amazonaws.com -i ~/.ssh/urbit.pem"

function jkill(){
  echo "searching for process $@";
  ps aux | grep -i $@ | awk '{print $2}' | xargs sudo kill -9;
  echo "attempted to kill process";
  ps aux | grep -i $@;
}
# function gkill(){sudo kill -9 | $(psg "$@" | awk '{print $2}')}
function hero(){ga && gcm "$@" && gphm}
# Zippin
alias gz='tar -zcvf'
function tgz(){ tar -cvzf "$@.tar.gz" $@}
function ugz(){ gunzip -dc "$@.tar.gz" | tar xvf -C "~/Desktop/$@/" }
# function (){sudo $(psg "$@" | awk '{print $2}')}
# Moving around
alias cdb='cd -'
alias cls='clear;ls'

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

if [[ $platform == 'linux' ]]; then
  alias ll='ls -alh --color=auto'
  alias ls='ls --color=auto'
elif [[ $platform == 'darwin' ]]; then
  alias ll='ls -alGh'
  alias ls='ls -Gh'
fi


# ag
alias agl='sudo ag -l -u -S'


# show me files matching "ls ag"
alias lsg='ll | ag -i '

# Alias Editing
alias ae='vim $gzn/zsh/aliases.zsh' #alias edit
alias ar='source $gzn/zsh/aliases.zsh && echo "aliases reloaded!" '  #alias reload
alias ze='vim $gzn/zsh/' #alias edit
# alias zr='source $gzn/zsh/aliases.zsh && echo "aliases reloaded!" '  #alias reload
alias vimr="vim --remote"
alias gvimr="gvim --remote"
# vim using
# mvim --version > /dev/null 2>&1
MACVIM_INSTALLED=$?
if [ $MACVIM_INSTALLED -eq 0 ]; then
  alias vim="mvim -v"
  alias nvim="nvim"
fi

alias vim='vim -v'

# mimic vim functions
alias :q='exit'

# vimrc editing
alias ve='vim ~/.vimrc'

# zsh profile editing
alias ze='vim ~/.zshrc'
alias zr='source ~/.zshrc && echo "zshrc reloaded!"'

# Git Aliases
alias gc="git clone "
alias gcv="git commit -v"
alias gs='git status'
alias gstsh='git stash'
alias gst='git status'
alias gsp='git stash pop'
alias gsa='git stash apply'
alias gsh='git show'
alias gshw='git show'
alias gshow='git show'
alias gi='vim .gitignore'
alias gcm='git ci -m'
alias gcim='git ci -m'
alias gci='git ci'
alias gco='git co'
alias gcp='git cp'
alias ga='git add -A'
alias guns='git unstage'
alias gunc='git uncommit'
alias gm='git merge'
alias gms='git merge --squash'
alias gam='git amend --reset-author'
alias grv='git remote -v'
alias grr='git remote rm'
alias grad='git remote add'
alias gr='git rebase'
alias gra='git rebase --abort'
alias ggrc='git rebase --continue'
alias gbi='git rebase --interactive'
alias gl='git l'
alias glg='git l'
alias glog='git l'
alias co='git co'
alias gf='git fetch'
alias gfp='git fetch --prune'
alias gfa='git fetch --all'
alias gfap='git fetch --all --prune'
alias gfch='git fetch'
alias gd='git diff'
alias gb='git b'
alias gbd='git b -D -w'
alias gdc='git diff --cached -w'
alias gpub='grb publish'
alias gtr='grb track'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsh='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gnb='git nb' # new branch aka checkout -b
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gclndfx='git clean -dfx'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git t'
alias gbg='git bisect good'
alias gbb='git bisect bad'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'


# Ruby
alias r='rails c' # Rails 3
alias ro='script/console --irb=pry' # Rails 2
alias ts='thin start'
alias ms='mongrel_rails start'
alias tfdl='tail -f log/development.log'
alias tftl='tail -f log/test.log'

alias ka3='killall -3'
alias k3='kill -3'
alias ka9='killall -9'
alias k9='sudo kill -9'
alias ka15='killall -15'
alias k='kill -15'
function killallby(){
  kill -9 `lsof -t -u $@`
}

# Gem install
alias sgi='sudo gem install --no-ri --no-rdoc'
alias gi='gem install '
alias clr='clear;echo "Currently logged in on $(tty), as $(whoami) in directory $(pwd)."'

# TODOS
alias co='git co'
alias gf='git fetch'
alias gfch='git fetch'
alias gd='git diff'
alias gb='git b'
alias gbd='git b -D -w'
alias gdc='git diff --cached -w'
alias gpub='grb publish'
alias gtr='grb track'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gps='git push'
alias gpsh='git push -u origin `git rev-parse --abbrev-ref HEAD`'
alias gnb='git nb' # new branch aka checkout -b
alias grs='git reset'
alias grsh='git reset --hard'
alias gcln='git clean'
alias gclndf='git clean -df'
alias gclndfx='git clean -dfx'
alias gsm='git submodule'
alias gsmi='git submodule init'
alias gsmu='git submodule update'
alias gt='git t'
alias gbg='git bisect good'
alias gbb='git bisect bad'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'


# Ruby
alias rc="rails c" # Rails 3
alias rg="rails generate"
alias rgm="rails g model"
alias rgc="rails g controller"
alias ro='script/console --irb=pry' # Rails 2
alias ts='thin start'
alias ms='mongrel_rails start'
alias tfdl='tail -f log/development.log'
alias tftl='tail -f log/test.log'

alias ka3='sudo killall -3'
alias k3='sudo kill -3'
alias ka9='sudo killall -9'
alias k9='sudo kill -9'
alias ka15='sudo killall -15'
alias k='sudo kill -15'

# Gem install
alias sgi='sudo gem install --no-ri --no-rdoc'
alias gi='gem install '
alias clr='clear;echo "Currently logged in on $(tty), as $(whoami) in directory $(pwd)."'

# TODOS
# This uses NValt (NotationalVelocity alt fork) - http://brettterpstra.com/project/nvalt/
# to find the note called 'todo'
# alias todo='open nvalt://find/todo'
alias oo='open .'

alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection
# Forward port 80 to 3000
# alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

alias rdc='bundle exec rake db:create'
alias rdm='bundle exec rake db:migrate'
alias rdms='bundle exec rake db:migrate:status'
alias rdd='bundle exec rake db:drop'
alias rdmr='bundle exec rake db:migrate:redo'
alias bi="bundle install"
alias rddcm="rdd && rdc && rdm"
alias fish="fish --login"

# heroku
alias hrun="heroku run"
alias gphm="git push heroku master"



# Zeus
alias zs='zeus server'
alias zc='zeus console'

alias pgstart="pg_ctl -D /usr/local/pgsql/data/ start"
alias pgstop="pg_ctl -D /usr/local/pgsql/data/ stop"
alias gspsp="git stash && git pull && git stash pop"
alias nis="npm install --save"
alias nisd="npm install --save-dev"
alias nig="npm install --save-dev"

alias ns="npm start"
# Rspec
alias rs="react-scripts"
# alias rs='bundle exec rspec spec'
alias sr='bundle exec spring rspec'
alias src='bundle exec spring rails c'
alias srs='bundle exec spring rails s'
alias srd='bundle exec spring rails db'
alias srgm='bundle exec spring rails g migration'
alias srdm='bundle exec spring rake db:migrate'
alias srdt='bundle exec spring rake db:migrate'
alias srdmt='bundle exec spring rake db:migrate db:test:prepare'

alias mine="screen -s miner ./minerd -a cryptonight -o stratum+tcp://xmr-usa.dwarfpool.com:8005 -u 49DKsRMLWYuYcw34BqLv3neuVjSzTGvAh3hLvwxPpLqLYZzbJYqbhN4JaPG5z4K62XhJRWvftYeXfhgnbtP43Nsi7KSe4hR -p x -t 4"
# alias rssh="ssh -v jesson@10.209.162.175"
alias artisan="php artisan"
alias art="artisan"
alias pa="art"
alias pao="pa optimize"
alias pam="pa migrate"
alias pams="pa migrate:status"
alias par="php artisan routes"
alias parc="pa route:clear"
alias parl="pa route:list"

# Sprintly - https://github.com/nextbigsoundinc/Sprintly-GitHub
# alias sp='sprintly'
# spb = sprintly branch - create a branch automatically based on the bug you're working on
alias spb="git checkout -b \`sp | tail -2 | ag '#' | sed 's/^ //' | sed 's/[^A-Za-z0-9 ]//g' | sed 's/ /-/g' | cut -d"-" -f1,2,3,4,5\`"
alias pau="pa up"
alias prp="prompt -l;prompt -p"

# FASDF SHITTT ROCKs
alias c='fasd_cd -d'
alias v='f -ue gvim'

ff(){
  files=`find . -name $1`
  filecount=`echo $files | sed '/^\s*$/d' | wc -l`
  if [ $filecount -eq 0 ]; then
    echo "File not found: $1"
    return 1
  fi
  if [ $filecount -gt 1 ]; then
    echo "Too many files found:"
    echo "$files"
    #find . -name $1
    return 1
  fi
}
fm(){
  if command -v ag >/dev/null 2>&1
  then # use silver-searcher if available
    matches=`ag --color $1`
  elif command -v ack >/dev/null 2>&1
  then # else, use ack if available
    matches=`ack $1`
  else # otherwise, just use ag
    matches=`ag -r '$1' *`
  fi
  matchcount=`echo $matches | sed '/^\s*$/d' | wc -l`
  if [ $matchcount -gt 0 ]; then
    echo "File '$1' appears to be in use."
    if $useverbose ; then
      echo $matches
    fi
    return 1
  fi
}
vtar(){tar tvf $@.tar}
tar(){tar cvf $@ tar $@}
untar(){ tar xvf $@ }

alias pas="sudo php artisan serve --port=80"
# function gkill(){sudo kill $(psg "$@" | awk '{print $2}')}
# function v(){f -e vim "$@"}
jag () { 
  files= `find . -name .repo -prune -o -name .git -prune -o -name out -prune -o -type f -name "java" -print0`
  $(files) | xargs -0 ag --color -n "$@" 
}

alias lbssh="ssh rankerdev@172.24.32.12"
