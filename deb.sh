function AptUpdatedToday() {
  local stampFile=/var/lib/apt/periodic/update-success-stamp
  if [[ -f $stampFile ]]; then
    local stampstring=$(stat -c %y /var/lib/apt/periodic/update-success-stamp)
    local stamp=$(date --date="$stampstring" +"%s")
    local now=$(date --date="$(date)" +"%s")
    local diff=$(echo "$now - $stamp" | bc)
    local aday=86400
    test $diff -lt $aday
  else
    return 1
  fi
}

function UpdateAptRepositories() {
  echo "Updating apt repositories ... "
  sudo apt-get update -qq
}

AptUpdatedToday || UpdateAptRepositories

sudo apt-get install -y git curl zsh vim python-software-properties

source $DOTCONF/common.sh

CheckInstall "tmux" || {
  sudo add-apt-repository ppa:pi-rho/dev
  sudo apt-get update
  sudo apt-get install tmux
}

CheckInstall "ack-grep" || {
  sudo apt-get install ack-grep
}

CheckInstall "node" || {
  curl -o /tmp/node.tar.gz http://nodejs.org/dist/v0.10.29/node-v0.10.29-linux-x64.tar.gz
  cd /usr/local
  sudo tar --strip-components 1 -zxf /tmp/node.tar.gz
  rm /tmp/node.tar.gz
  cd ~/.conf && npm install
}

CheckInstall "redis-server" || sudo apt-get -y install redis-server

CheckInstall "mongo" || {
  sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
  sudo apt-get update
  sudo apt-get -y install mongodb-org
}

CheckInstall "mosh" || {
  sudo apt-get install -y python-software-properties
  sudo add-apt-repository -y ppa:keithw/mosh
  UpdateAptRepositories
  sudo apt-get install -y mosh
}
