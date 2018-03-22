git config --global core.editor "vim"
git config --global color.diff true
git config --global diff.submodule log
git config --global user.email "user@host"
git config --global user.name "user"
git config --global push.default matching
git config --global core.excludesfile $DOTCONF/dotfiles/gitignore_global
echo "git configured per $DOTCONF/gitconfig.sh"
