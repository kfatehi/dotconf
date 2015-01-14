if [[ ! -d "$MY_DOTFILES" ]]; then
echo "Please set MY_DOTFILES to the dotfiles path, currently $MY_DOTFILES"
exit -1
fi

# Cleaning dotfiles
rm -rf \
    ~/.vim \
    ~/.vimrc \
    ~/.tmux.conf \
    ~/.tmux-osx.conf \
    ~/.tmux-nested.conf \
    ~/.tmux-1.9.conf \
    ~/.ackrc

# Linking dotfiles
ln -s $MY_DOTFILES/vim/vimfiles     ~/.vim
ln -s $MY_DOTFILES/vim/vimrc        ~/.vimrc
ln -s $MY_DOTFILES/tmux.conf        ~/.tmux.conf
ln -s $MY_DOTFILES/tmux-osx.conf    ~/.tmux-osx.conf
ln -s $MY_DOTFILES/tmux-nested.conf ~/.tmux-nested.conf
ln -s $MY_DOTFILES/tmux-1.9.conf    ~/.tmux-1.9.conf
ln -s $MY_DOTFILES/ackrc.conf       ~/.ackrc
echo "vim symlinked"
echo "tmux symlinked"
echo "ackrc symlinked"
