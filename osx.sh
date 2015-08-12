source $DOTCONF/common.sh

brew install tree wget nmap ack tmux reattach-to-user-namespace node

YesOrNo "Install some global npm modules?" || AfterInstall 'node'

if [[ ! -f ~/.iterm2/monokai_soda.itermcolors ]]; then
  mkdir -p ~/.iterm2
  MONOKAI_URL="https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Monokai%20Soda.itermcolors"
  curl -fsSL $MONOKAI_URL > ~/.iterm2/monokai_soda.itermcolors
  open ~/.iterm2/monokai_soda.itermcolors
fi
