# .conf

bootstrap my dev environment and related tools. Supported on:

* ArchLinux
* Debian & Ubuntu
* Mac OS X
* Windows (MinGW or "Git Bash", and Cygwin)
* Raspbian

## Install

dont use, this is broken now

```bash
curl -fsSL https://raw.githubusercontent.com/kfatehi/dotconf/master/bootstrap | bash -e
```

## Minimal (just tmux and vim)

```bash
#!/bin/bash
pushd ~                                                                                                                                                                                                      
for f in vimrc tmux.conf; do
  echo ".$f"
  curl -o .$f https://raw.githubusercontent.com/kfatehi/dotconf/master/dotfiles/$f
done
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugUpgrade +PlugInstall +qall
popd
```
