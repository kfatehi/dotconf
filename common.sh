source $DOTCONF/helpers.sh
source $DOTCONF/gitconfig.sh

source $DOTCONF/vim-setup.sh

DotconfSymlink "tmux.conf"
DotconfSymlink "tmux-osx.conf"
DotconfSymlink "tmux-linux.conf"
DotconfSymlink "ackrc"

DropboxDotfileSymlink "ssh" && chmod 400 ~/.ssh/id_rsa

#DotconfSymlink "zpreztorc"
#DotconfSymlink "zshenv"
