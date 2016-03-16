sudo apt-get install -y git curl vim python-software-properties ack-grep

source $DOTCONF/common/all.sh


CheckInstall "tmux" || {
  sudo add-apt-repository ppa:pi-rho/dev
  sudo apt-get update
  sudo apt-get install tmux
}

CheckInstall "mosh" || {
  sudo apt-get install -y python-software-properties
  sudo add-apt-repository -y ppa:keithw/mosh
  UpdateAptRepositories
  sudo apt-get install -y mosh
}
