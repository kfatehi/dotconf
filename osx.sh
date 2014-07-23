source $DOTCONF/common.sh
CheckInstall "brew" || ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
CheckInstall "wget" || brew install wget
CheckInstall "nmap" || brew install nmap
CheckInstall "node" || brew install node
CheckInstall "tmux" || brew install tmux reattach-to-user-namespace
CheckInstall "ack" || brew install ack
CheckInstall "mongo" || brew install mongodb
CheckInstall "terminal-notifier" || brew install terminal-notifier
CheckInstall "weechat" || brew install weechat
CheckInstall "redis-server" || brew install redis
CheckInstall "phantomjs" || brew install phantomjs
CheckInstall "postgres" || brew install postgres
CheckInstall "boot2docker" || brew install boot2docker


