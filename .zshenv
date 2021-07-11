# force a `yadm pull` every time on login
ping -c1 -W1 1.1.1.1 >/dev/null 2>&1
if [ $? = 0 ]; then
  yadm pull
fi

export GPG_TTY=$(tty)

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=C

export NVM_DIR=$HOME/.nvm

alias ts="tmux new-session -A -s"

for x in 1 2 3 4 5 6 7 8; do alias "pi$x"="ssh -i ~/.ssh/id_thomas thomas@pilina-0$x.local"; done

devenv() {
  docker run --rm --privileged -ite REPO=$1 --mount source=devenv,target=/home/thomas/workspace -v /var/run/docker.sock:/var/run/docker.sock tstachl/devenv
}

