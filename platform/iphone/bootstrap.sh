source $DOTCONF/common/all.sh

CheckInstall "tmux" || {
  apt install tmux
}
