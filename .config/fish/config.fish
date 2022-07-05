if status --is-interactive; and not test -e "$HOME/.ssh/id_thomas"
  yadm decrypt
end

if not functions -q fundle
  eval (curl -sfL https://git.io/fundle-install)
end

fundle plugin "pure-fish/pure"

fundle init


