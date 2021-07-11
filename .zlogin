# force a `yadm pull` every time on login
ping -c1 -W1 1.1.1.1 >/dev/null 2>&1
if [ $? = 0 ]; then
  yadm pull
fi

# force `yadm decrypt` on first login
if [ ! -f "$HOME/.ssh/id_thomas" ]; then
  yadm decrypt
fi

