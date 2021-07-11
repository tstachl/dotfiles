# force `yadm decrypt` on first login
if [! -f "$HOME/.ssh/id_thomas" ]; then
  yadm decrypt
fi

