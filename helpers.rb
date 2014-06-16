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

def zsh script
  Process.wait Process.spawn("/bin/zsh", "-c", script)
end

def bash script
  Process.wait Process.spawn("/bin/bash", "-c", script)
end

def run message, script
  if yesno "#{message} (y/n)"
    zsh script
  end
end

def home
  File.expand_path '~'
end

def dotfile name
  File.join(ENV['MY_DOTFILES'], name)
end

def checkinstall packages
  packages.each do |bin, script|
    bin = bin.to_s
    run("Install #{bin} ?", script) unless find_executable(bin)
  end
end

def global_gitignore patt
  bash %{echo #{patt} >> ~/.gitignore}
end

def enable_zsh_module name
  bash <<-EOF
  sed '/prezto:load..pmodule/a\\
  \\ \\ '$"'#{name}'"$' \\\\\\
  ' ~/.zpreztorc > /tmp/zpreztorc
  cat /tmp/zpreztorc > ~/.zpreztorc
  rm /tmp/zpreztorc
  EOF
end
