require ENV["COMMON"]
require 'mkmf'

run "Setup the home directory ?", <<-EOF
#{home_setup}
echo "export PATH=\"\\$PATH:\\$HOME/.rvm/bin\"" >> ~/.zshrc
EOF

{
  tmux: "sudo apt-get install -y tmux",
 
  "redis-server" => "sudo apt-get -y install redis-server",

  node: %{
    curl -o /tmp/node.tar.gz http://nodejs.org/dist/v0.10.28/node-v0.10.28-linux-x64.tar.gz
    cd /usr/local
    sudo tar --strip-components 1 -zxf /tmp/node.tar.gz
    rm /tmp/node.tar.gz
  },

  mongo: %{
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
    echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

    sudo apt-get update
    sudo apt-get -y install mongodb-org
  }
}.each{|name, script|
  bin = name.to_s
  run("Install #{bin} ?", script) unless find_executable(bin)
}
