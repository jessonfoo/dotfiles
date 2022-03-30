# Aliases in this file are bash and zsh compatible

gzn=$HOME/.gzn
#custom  aliases

alias games='/usr/share/emacs/22.1/lisp/play'

# fucking common typos lol
alias isntall='install'

# Don't change. The following determines where gzn is installed.

# htop
alias htop='sudo htop; echo oof123'

# Get operating system
platform='unknown'
unamestr=${uname}
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

# backup shortcuts using mackup [pip install mackup]
alias mbackup="mackup backup"

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

# alias jssh="ssh root@104.131.154.83 -o=stricthostkeychecking=no"
alias ossh="ssh root@192.241.203.47 -o=stricthostkeychecking=no"
alias jssh="ssh root@104.131.154.83 -o=stricthostkeychecking=no"
alias gssh="ssh root@104.236.169.67 -o=stricthostkeychecking=no"
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

alias tcs="tmux choose-session"
alias trs="tmux rename-session -t"
alias trw="tmux rename-window -t"
# gzn suppore
alias yav='gzn vim-add-plugin'
alias ydv='gzn vim-delete-plugin'
alias ylv='gzn vim-list-plugin'
alias yup='gzn update-plugins'
alias yip='gzn init-plugins'

# PS
alias psa="ps aux"
alias psg="ps aux | grep -i "
alias psr='ps aux | grep -i ruby'

function gkill(){sudo kill $(psg "$@" | awk '{print $2}')}
function dn() { echo "$(dirname -- $(which "$@"))" }
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

# show me files matching "ls grep"
alias lsg='ll | grep -i '

# Alias Editing
alias ae='vim $gzn/zsh/aliases.zsh' #alias edit
alias ar='source $gzn/zsh/aliases.zsh && echo "aliases reloaded!" '  #alias reload
alias zr='source $HOME/.zshrc && echo "zsh reloaded!" '  #zsh reload

alias vimr="vim --remote"
alias gvimr="gvim --remote"
# vim using
mvim --version > /dev/null 2>&1
MACVIM_INSTALLED=$?
if [ $MACVIM_INSTALLED -eq 0 ]; then
  alias vim="mvim -v"
fi


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

# Zippin
alias gz='tar -zcvf'

# Ruby
alias c='rails c' # Rails 3
alias co='script/console --irb=pry' # Rails 2
alias ts='thin start'
alias ms='mongrel_rails start'
alias tfdl='tail -f log/development.log'
alias tftl='tail -f log/test.log'

alias ka9='killall -9'
alias k9='kill -9'

# Gem install
alias sgi='sudo gem install --no-ri --no-rdoc'
alias gi='gem install '

# TODOS
# This uses NValt (NotationalVelocity alt fork) - http://brettterpstra.com/project/nvalt/
alias todo='open nvalt://find/todo'
# to find the note called 'todo'

# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

alias rdm='rake db:migrate'
alias rdmr='rake db:migrate:redo'

# Zeus
alias zs='zeus server'
alias zc='zeus console'

# Rspec
alias rs='rspec spec'
alias sr='spring rspec'
alias src='spring rails c'
alias srgm='spring rails g migration'
alias srdm='spring rake db:migrate'
alias srdt='spring rake db:migrate'
alias srdmt='spring rake db:migrate db:test:prepare'

# Sprintly - https://github.com/nextbigsoundinc/Sprintly-GitHub
alias sp='sprintly'
# spb = sprintly branch - create a branch automatically based on the bug you're working on
alias spb="git checkout -b \`sp | tail -2 | grep '#' | sed 's/^ //' | sed 's/[^A-Za-z0-9 ]//g' | sed 's/ /-/g' | cut -d"-" -f1,2,3,4,5\`"

alias hpr='hub pull-request'
alias grb='git recent-branches'

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

alias dbtp='spring rake db:test:prepare'
alias dbm='spring rake db:migrate'
alias dbmr='spring rake db:migrate:redo'
alias dbmd='spring rake db:migrate:down'
alias dbmu='spring rake db:migrate:up'

# Homebrew
alias br='brew'
alias brewu='brew upgrade && brew upgrade && brew cleanup && brew prune && brew doctor'
alias bri="brew install"
alias bru="brew upgrade"
alias brd="brew doctor"
alias brci='brew cask install --appdir="/Applications"'
alias rnnitp="./node_modules/react-native/scripts/ios-install-third-party.sh"
alias rncglog="cd node_modules/react-native/third-party/glog-*; ../../scripts/ios-configure-glog.sh; cd-"



#superUser
alias sudoself="sudo su $USER"
alias hdu="diskutil"
alias rn="react-native"
alias rni="rn init"
alias rnri="rn run-ios"
alias nig="npm install -g"
alias lsis="lsof -i :8081"
alias minexmr='sudo /Users/jessonfoo/Extracted/minergate-cli/minergate-cli -user jessonfoo@gmail.com -xmr'
alias oo="open ."
alias npmisd="npm install --save-dev"

alias schown="sudo chown"
alias schmod="sudo chmod"
alias tmce="vim $HOME/.tmux.conf"

alias rtestsocaml="OCAMLPATH=dep dune runtest -f"


# Spoofing
alias checkMac="ifconfig en0 |grep ether"
alias spoofRandomMac="sudo ifconfig en0 ether $(openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//')"
alias minexmr="./xmrig -o us-west.minexmr.com:443 -u 45nEqufntPvj3rSZZDdxgE5DJcPpXD5MeRu9ov76yiEARoGg4xKjhsydmJ9BTv9Uf7NsBDikmfP8VEvoRbCGLfVC4qy7u22 -k --tls --rig-id 3rSZZDdxgE5DJcPpXD5MeRu9ov76yiEARoGg4xKjhsydmJ9BTv9Uf7NsBDikmfP8VEvoRbCGLfVC4qy7u22 -k --tls --rig-id \"jesson imac\""
alias dsu="diskutil"



#node & yarn
alias y="yarn --json --link-duplicates --update-checksumsx"
alias yh="yarn help"
alias yr="yarn run"
alias yrm="yarn remove"
alias yi="yarn install --check-files -s"
alias ya="yarn add"
alias yag="yarn add global"
alias ycc="yarn cache clean"


#rvm
alias rv="rvm"
alias ri="rvm install"
alias rl="rvm list"
alias rln="rvm list known"
alias rirh="rvm install ruby-head"
alias rvac="rvm alias create"
alias rl='rvm alias list && rvm list'



#aws bitnami server packaged
function viewLogActionsByIp() {·········································································································
    grep "$@" "/opt/bitnami/nginx/logs/access.log"
}
alias checkAccessLog="cat /opt/bitnami/nginx/logs/access.log | awk '{print $1}' | sort | uniq -c | sort -nr| head -n 20"·
alias agi="sudo apt-get install -y"
alias ctl="sudo /opt/bitnami/ctlscript.sh"
alias agi="sudo apt-get install"
alias acs="sudo apt-cache search"
alias ctl="sudo /opt/bitnami/ctlscript.sh"
alias ctlS="sudo ctl status"
alias gonitS="sudo gonit status"
alias monitS="sudo monit status"
alias monitM="sudo monit monitor"

function ctlR() {
  declare -a modules
  modules=($@)
  for m in ${modules}; do·
    eval "sudo /opt/bitnami/ctlscript.sh restart $m"
  done
}
function ctlSp() {
  declare -a modules
  modules=($@)
  for m in ${modules}; do·
    eval "sudo /opt/bitnami/ctlscript.sh stop $m"
  done
}
function ctlSt() {
  declare -a modules
  modules=($@)
  for m in ${modules}; do·
    eval "sudo /opt/bitnami/ctlscript.sh start $m"
  done
}




function certUpdate(){

  if  [-f /opt/bitnami/nginx/conf/bitnami/certs/server.crt.old]; then
    sudo rm -rf /opt/bitnami/nginx/conf/bitnami/certs/*.old·
  fi
  if [ -f /opt/bitnami/nginx/conf/bitnami/certs/server.crt ]; then·
    sudo mv /opt/bitnami/nginx/conf/bitnami/certs/server.crt /opt/bitnami/nginx/conf/bitnami/certs/server.crt.old
    sudo mv /opt/bitnami/nginx/conf/bitnami/certs/server.key /opt/bitnami/nginx/conf/bitnami/certs/server.key.old
    sudo mv /opt/bitnami/nginx/conf/bitnami/certs/server.csr /opt/bitnami/nginx/conf/bitnami/certs/server.csr.old
  fi
  sudo ln -sf /opt/bitnami/letsencrypt/certificates/$@.key /opt/bitnami/nginx/conf/bitnami/certs/server.key
  sudo ln -sf /opt/bitnami/letsencrypt/certificates/$@.crt /opt/bitnami/nginx/conf/bitnami/certs/server.crt
  sudo chown root:root /opt/bitnami/nginx/conf/bitnami/certs/server*
  sudo chmod 600 /opt/bitnami/nginx/conf/bitnami/certs/server*
}


function validateDomains(){

  shead="sudo /opt/bitnami/letsencrypt/lego --tls -m jessson@garbagedream.com"
  stail=" --path=\"/opt/bitnami/letsencrypt\" run;"
  ds=""
  declare -a dargs
  dargs=($@)
    for d in ${dargs[@]}; do
      ds+=" -d $d";
    done
    cmd=$shead$ds$stail
    
  eval $cmd
  if [ -f /opt/bitnami/letsencrypt/certificates/$1 ]; then
    certUpdate $0
  fi
}



function getWP(){
 (cd /tmp && wget https://wordpress.org/latest.tar.gz && sudo tar xfvz latest.tar.gz -C /opt/bitnami/ )
}

function chwpownmod(){
  (sudo chown -R daemon:daemon /opt/bitnami/wordpress && sudo chmod -R g+w /opt/bitnami/wordpress)·
}

function makeHttpServerBlock(){
    echo 'server {
      listen 80 default_server;
      root /opt/bitnami/wordpress;
      server_name _;

      index index.php;

      location / {
        try_files $uri $uri/ /index.php?q=$uri&$args;
      }

      if (!-e $request_filename)
      {
        rewrite ^/(.+)$ /index.php?q=$1 last;
      }

      include  "/opt/bitnami/nginx/conf/bitnami/*.conf";
    }' > /opt/bitnami/nginx/conf/server_blocks/wordpress-server-block.conf;
}

function makeHttpsServerBlock() {
      echo '
      server {
        # Port to listen on, can also be set in IP:PORT format
        listen 443 ssl default_server;
        root /opt/bitnami/wordpress;
        # Catch-all server block
        # See: https://nginx.org/en/docs/http/server_names.html#miscellaneous_names
        server_name _;
        ssl_certificate      bitnami/certs/server.crt;
        ssl_certificate_key  bitnami/certs/server.key;
        location / {
          try_files $uri $uri/ /index.php?q=$uri&$args;
        }
        if (!-e $request_filename)
        {
          rewrite ^/(.+)$ /index.php?q=$1 last;
        }
        include  "/opt/bitnami/nginx/conf/bitnami/*.conf";
    }' >  /opt/bitnami/nginx/conf/server_blocks/wordpress-https-server-block.conf

}


function createServerBlocks(){
  (makeHttpServerBlock && makeHttpsServerBlock)
}


