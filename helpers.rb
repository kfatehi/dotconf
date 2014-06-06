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
