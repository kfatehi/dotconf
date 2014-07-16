function YesOrNo() {
  read -p "Install $1 (y/n)?" choice
  case "$choice" in 
    y|Y ) return 1;;
    n|N|* ) return 0;;
  esac
}

function CheckInstall() {
  hash $1 >/dev/null 2>&1 || YesOrNo $1
}

function EnableZmodule() {
  sed "/prezto:load..pmodule/a\\ \ \'$1\' \\\\" ~/.zpreztorc > /tmp/zpreztorc
  cat /tmp/zpreztorc > ~/.zpreztorc
  rm /tmp/zpreztorc
}

test -f /bin/zsh && test "$SHELL" = "/bin/zsh" || chsh -s /bin/zsh

test -f /bin/zsh && test -f $HOME/.zpreztorc || {
  echo "Install zprezto?"
  YesOrNo || {
    # Installing zprezto
    $DOTCONF/install_zprezto.zsh
    echo "PATH=\\$PATH:$MY_BINS" >> ~/.zshrc
    EnableZmodule "git"
  }
}


# Cleaning dotfiles
rm -rf \
    ~/.gitignore \
    ~/.vim \
    ~/.vimrc \
    ~/.tmux.conf \
    ~/.tmux-osx.conf \
    ~/.tmux-nested.conf \

# Linking dotfiles
ln -s $MY_DOTFILES/vimfiles         ~/.vim
ln -s $MY_DOTFILES/vimrc            ~/.vimrc
ln -s $MY_DOTFILES/tmux.conf        ~/.tmux.conf
ln -s $MY_DOTFILES/tmux-osx.conf    ~/.tmux-osx.conf
ln -s $MY_DOTFILES/tmux-nested.conf ~/.tmux-nested.conf

git config --global core.editor "vim"
git config --global color.diff true
git config --global user.email "keyvanfatehi@gmail.com"
git config --global user.name "Keyvan Fatehi"
git config --global push.default matching
git config --global core.excludesfile ~/.gitignore
cat <<-EOF >  ~/.gitignore
.DS_Store
npm-debug.log
.netrwhist
*.swo
*.swp
EOF

vim +BundleInstall +qall
