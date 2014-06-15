require ENV["COMMON"]

home_setup do
  global_gitignore '.DS_Store'
end

checkinstall({
  brew: %{ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"},
  wget: "brew install wget",
  nmap: "brew install nmap",
  node: "brew install node",
  tmux: "brew install tmux reattach-to-user-namespace",
  irssi: "brew install irssi",
  "terminal-notifier" => "brew install terminal-notifier",
  ack: "brew install ack",
  mongo: "brew install mongodb",
  "redis-server" => "brew install redis",
  phantomjs: "brew install phantomjs",
  postgres: "brew install postgres"
})
