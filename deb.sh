function AptUpdatedToday() {
  # won't work on darwin due to `stat` differences
  # but i guess you could use ruby there
  local stampFile=/var/lib/apt/periodic/update-success-stamp
  if [[ -f $stampFile ]]; then
    local stampstring=$(stat -c %y $stampFile)
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

sudo apt-get install -y git curl zsh vim python-software-properties ack-grep

source $DOTCONF/common.sh

CheckInstall "tmux" || {
  sudo add-apt-repository ppa:pi-rho/dev
  sudo apt-get update
  sudo apt-get install tmux
}

CheckInstall "node" || {
  curl --silent --location https://deb.nodesource.com/setup_0.12 | sudo bash -
  sudo apt-get install -y nodejs
}

CheckInstall "mosh" || {
  sudo apt-get install -y python-software-properties
  sudo add-apt-repository -y ppa:keithw/mosh
  UpdateAptRepositories
  sudo apt-get install -y mosh
}
