require ENV["HELPERS"]

def cleaning
  %W{
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
end

def linking
  {
    dotfile("vimfiles")      => "~/.vim",
    dotfile("vimrc")         => "~/.vimrc",
    dotfile("tmux.conf")     => "~/.tmux.conf",
    dotfile("tmux-osx.conf") => "~/.tmux-osx.conf"
  }.map{|src,dst| "ln -s #{src} #{dst}"}.join("\n")
end

def home_setup
 <<-EOF
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
  EOF
end
