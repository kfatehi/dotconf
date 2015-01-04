source $DOTCONF/gitconfig.sh
echo "set runtimepath+=\$HOME/.conf/dotfiles/vim" > "$HOME/.vimrc" 
echo "vim runtime path set"
# vim +BundleInstall +qall
