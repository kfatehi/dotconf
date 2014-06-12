require ENV["HELPERS"]
require 'mkmf'

def cleaning
  %W{
    ~/.gitignore
    ~/.vim
    ~/.vimrc
    ~/.tmux.conf
    ~/.tmux-osx.conf
    ~/.tmux-nested.conf
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
    dotfile("tmux-osx.conf") => "~/.tmux-osx.conf",
    dotfile("tmux-nested.conf") => "~/.tmux-nested.conf"
  }.map{|src,dst| "ln -s #{src} #{dst}"}.join("\n")
end

def home_setup
  return unless yesno("Reconfigure zsh and the home directory ?")

  zsh <<-EOF
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
  git config --global push.default matching
  git config --global core.excludesfile ~/.gitignore
  touch ~/.gitignore

  vim +BundleInstall +qall
  EOF
  enable_zsh_module('git')
  bash("chsh -s /bin/zsh") if  ENV['SHELL'] != "/bin/zsh"
  bash(rvm_codes) if find_executable("rvm")
  yield if block_given?
  global_gitignore 'npm-debug.log'
  global_gitignore '.netrwhist'
  global_gitignore '*.swo'
  global_gitignore '*.swp'
end

def rvm_codes
  <<-EOF
    echo "source \\$HOME/.rvm/scripts/rvm" >> ~/.zshrc
    echo "export PATH=\"\\$PATH:\\$HOME/.rvm/bin\"" >> ~/.zshrc
  EOF
end

