def yesno str=nil
  begin
    puts str if str
    system("stty raw -echo")
    str = STDIN.getc.upcase
  ensure
    system("stty -raw echo")
  end
  if str == "Y"
    return true
  else
    return false
  end
end

def run message, script
  if yesno "#{message} (y/n)"
    Process.wait Process.spawn("/bin/zsh", "-c", script)
  end
end

def home
  File.expand_path '~'
end

def dotfile name
  File.join(ENV['MY_DOTFILES'], name)
end

cleaning = %W{
  ~/.vim
  ~/.vimrc
  ~/.tmux.conf
  ~/.tmux-osx.conf
  ~/.zlogin
  ~/.zlogout
  ~/.zprezto
  ~/.zpreztorc
  ~/.zprofile
  ~/.zshenv
  ~/.zshrc
}.map{|i| "rm -rf #{i}" }.join("\n")

linking = {
  dotfile("vimfiles")      => "~/.vim",
  dotfile("vimrc")         => "~/.vimrc",
  dotfile("tmux.conf")     => "~/.tmux.conf",
  dotfile("tmux-osx.conf") => "~/.tmux-osx.conf"
}.map{|src,dst| "ln -s #{src} #{dst}"}.join("\n")

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
#{cleaning}
#{linking}
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
echo "PATH=\\$PATH:#{ENV['MY_BINS']}" >> ~/.zshrc

git config --global core.editor "vim"
git config --global color.diff true
git config --global user.email "keyvanfatehi@gmail.com"
git config --global user.name "Keyvan Fatehi"

vim +BundleInstall +qall

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
#{brewing}

chsh -s /bin/zsh
EOF

