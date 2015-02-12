source $DOTCONF/common.sh
CheckInstall "brew" || {
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  brew install tree
  brew install wget
  brew install mobile-shell
  # brew install httpie
  brew install ngrok
  brew install nmap
  brew install node && AfterInstall 'node'
  brew install tmux reattach-to-user-namespace
  brew install ack
  brew install mongodb
  brew install terminal-notifier
  # brew install weechat --with-python --with-ruby --with-perl
  brew install redis
}

if [[ ! -f /usr/local/bin/brew-cask.rb ]]; then
  YesOrNo "brew cask?" || {
    brew install caskroom/cask/brew-cask
    brew cask

    # brew cask install alfred && brew cask alfred link
    brew cask install dropbox
    # brew cask install teleport
    brew cask install iterm2
    brew cask install launchrocket
    brew cask install gitx-rowanj
    brew cask install google-chrome
    brew cask install spotify
    brew cask install slack
    brew cask install mailplane
    brew cask install onepassword
    brew cask install robomongo
    brew cask install google-hangouts
    brew cask install skype
    # brew cask install dewdrop
    # ~/.misc/setup_dewdrop.sh
    # brew cask install airdisplay
    brew cask install xquartz
    brew cask install virtualbox
    brew cask install firefox
  }
fi

if [[ ! -f ~/.iterm2/monokai_soda.itermcolors ]]; then
  mkdir -p ~/.iterm2
  MONOKAI_URL="https://raw.githubusercontent.com/mbadolato/iTerm2-Color-Schemes/master/schemes/Monokai%20Soda.itermcolors"
  curl -fsSL $MONOKAI_URL > ~/.iterm2/monokai_soda.itermcolors
  open ~/.iterm2/monokai_soda.itermcolors
fi
