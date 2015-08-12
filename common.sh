source $DOTCONF/helpers.sh

#set x
set -e

if [[ -f /bin/zsh ]]; then
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
    }
  fi
  # Customize the prompt
  rm -f ~/.zprezto/modules/prompt/functions/prompt_sorin_setup
  ln -s $MY_DOTFILES/prompt_sorin_setup ~/.zprezto/modules/prompt/functions/prompt_sorin_setup 
else
  echo "zshell not found, skipping zprezto install" >&2
fi

DropboxDotfileSymlink "ssh"
chmod 400 ~/.ssh/id_rsa
DotconfSymlink "zshenv"
DotconfSymlink "zpreztorc"
DotconfSymlink "vim"
DotconfSymlink "vimrc"
DotconfSymlink "tmux.conf"
DotconfSymlink "tmux-osx.conf"
DotconfSymlink "tmux-linux.conf"
DotconfSymlink "tmux-nested.conf"
DotconfSymlink "tmux-1.9.conf"
DotconfSymlink "ackrc"

source $DOTCONF/gitconfig.sh
source $DOTCONF/vim-setup.sh
