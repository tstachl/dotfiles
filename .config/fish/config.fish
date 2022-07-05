if not functions -q fundle
  eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin "pure-fish/pure"

fundle init

if status --is-interactive
  if not test -e "$HOME/.ssh/id_thomas"
    yadm decrypt
  end

  # check if we have internet connection and pull yadm  
  if ping -c1 -W1 1.1.1.1 >/dev/null 2>&1
    yadm pull
  end
end


