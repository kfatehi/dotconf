source $DOTCONF/common.sh
CheckInstall "brew" || ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
CheckInstall "wget" || brew install wget
CheckInstall "http" || brew install httpie
CheckInstall "nmap" || brew install nmap
CheckInstall "node" || brew install node
CheckInstall "tmux" || brew install tmux reattach-to-user-namespace
CheckInstall "ack" || brew install ack
CheckInstall "mongo" || brew install mongodb
CheckInstall "terminal-notifier" || brew install terminal-notifier
CheckInstall "weechat" || brew install weechat --with-python --with-ruby
CheckInstall "redis-server" || brew install redis
# CheckInstall "phantomjs" || brew install phantomjs
# CheckInstall "postgres" || brew install postgres
CheckInstall "boot2docker" || brew install boot2docker
CheckInstall "chromedriver" || brew install chromedriver
CheckInstall "lolcommits" || {
  brew install imagemagick
  sudo gem install lolcommits
}
CheckInstall "mosh" || brew install mobile-shell

if [[ ! -f /usr/local/bin/brew-cask.rb ]]; then
  YesOrNo "brew cask?" || {
    brew install caskroom/cask/brew-cask
    brew cask
    echo "Rerun the bootstrap to install all casks"
  }
else
  DropboxDotfileSymlink "ssh"
  DropboxDotfileSymlink "weechat"
  DropboxDotfileSymlink "lolcommits"

  brew cask install alfred && brew cask alfred link
  brew cask install launchrocket
  brew cask install iterm2
  brew cask install gitx-rowanj
  brew cask install google-chrome
  brew cask install dropbox
  brew cask install spotify
  brew cask install slack
  brew cask install mailplane
  brew cask install onepassword
  brew cask install robomongo
  brew cask install google-hangouts
  brew cask install skype
  brew cask install cloudapp
  brew cask install airdisplay
  brew cask install virtualbox
fi
