source $DOTCONF/helpers.sh
source $DOTCONF/gitconfig.sh

DotconfSymlink "vim"
DotconfSymlink "vimrc"
source $DOTCONF/vim-setup.sh

DotconfSymlink "tmux.conf"
DotconfSymlink "tmux-osx.conf"
DotconfSymlink "tmux-linux.conf"
DotconfSymlink "tmux-nested.conf"
DotconfSymlink "tmux-1.9.conf"
DotconfSymlink "ackrc"

if [[ -d $HOME/Dropbox ]]; then
  DropboxDotfileSymlink "ssh"
  chmod 400 ~/.ssh/id_rsa
else
  echo "warning: no dropbox dir, skipping private symlinks"
fi

if [[ -f /bin/zsh ]]; then
  DotconfSymlink "zshenv"
  DotconfSymlink "zpreztorc"

  test -f /bin/zsh && test "$SHELL" = "/bin/zsh" || {
    YesOrNo "Change shell to zsh?" || {
       chsh -s /bin/zsh
    }
  }
  if [[ ! -f $HOME/.zpreztorc ]]; then
    YesOrNo "Install zprezto?" || {
      # Installing zprezto
      $DOTCONF/install_zprezto.zsh
      echo 'PATH="$PATH:'$MY_BINS':'$MY_NODE_BINS'"' >> ~/.zshrc
      # Customize the prompt
      local prompt_conf="$HOME/.zprezto/modules/prompt/functions/prompt_sorin_setup"
      rm -f $prompt_conf
      ln -s $MY_DOTFILES/prompt_sorin_setup $prompt_conf
    }
  fi
else
  echo "zshell not found, skipping zprezto install" >&2
fi
