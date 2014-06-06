require ENV["COMMON"]

brewing = %W{
  wget
  nmap
  node
  tmux
  reattach-to-user-namespace
  mongodb
  redis
  postgres
  phantomjs
}.map{|app| "brew install #{app}"}.join("\n")

run "Proceed ?", <<EOF
#{home_setup}
ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
#{brewing}
chsh -s /bin/zsh
EOF

