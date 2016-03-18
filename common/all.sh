source $DOTCONF/common/helpers.sh
source $DOTCONF/common/gitconfig.sh
source $DOTCONF/common/vim-setup.sh

# tries to link if it finds a cloud storage path
CloudDotfileSymlink "ssh" && chmod 400 ~/.ssh/id_rsa

# links these
DotconfSymlink "bash_profile"
DotconfSymlink "bashrc"
DotconfSymlink "tmux.conf"
DotconfSymlink "tmux-osx.conf"
DotconfSymlink "tmux-linux.conf"
DotconfSymlink "ackrc"
