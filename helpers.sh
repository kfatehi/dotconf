if [[ ! -d "$MY_DOTFILES" ]]; then
  echo "Please set MY_DOTFILES to the dotfiles path, currently $MY_DOTFILES"
  exit -1
fi

function AfterInstall() {
  local script=$DOTCONF/after/$1
  if [[ -f $script ]]; then
    pushd $DOTCONF > /dev/null
    echo "executing post-install script $script"
    source $script
    popd > /dev/null
  fi
}

function YesOrNo() {
  read -p "$1 (y/N)? " choice
  case "$choice" in 
    y|Y ) return 1;;
    n|N|* ) return 0;;
  esac
}

function DropboxDotfileSymlink() {
  local src=$HOME/Dropbox/dotfiles_private/$1
  local target=$HOME/.$1
  rm -f $target
  ln -s $src $target
  echo "link: $target -> $src"
}

function DotconfSymlink() {
  local src=$MY_DOTFILES/$1
  local target=$HOME/.$1
  rm -f $target
  ln -s $src $target
  echo "link: $target -> $src"
}

function CheckInstall() {
  hash $1 >/dev/null 2>&1 || YesOrNo $1
}
