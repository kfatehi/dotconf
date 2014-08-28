source $DOTCONF/common.sh
CheckInstall "brew" || {
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  brew install wget
  brew install mobile-shell
  brew install httpie
  brew install ngrok
  brew install nmap
  brew install node && cd ~/.conf && npm install
  brew install tmux reattach-to-user-namespace
  brew install ack
  brew install mongodb
  brew install terminal-notifier
  brew install weechat --with-python --with-ruby --with-perl
  brew install redis
}

if [[ ! -f /usr/local/bin/brew-cask.rb ]]; then
  YesOrNo "brew cask?" || {
    brew install caskroom/cask/brew-cask
    brew cask

    brew cask install alfred && brew cask alfred link
    brew cask install dropbox
    brew cask install teleport
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
    brew cask install dewdrop
    brew cask install airdisplay
    brew cask install xquartz
    brew cask install virtualbox
    brew cask install firefox
  }
fi
