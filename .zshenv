# - - - - - - - - - - - - - - - - - - - -
# Homebrew Configuration
# - - - - - - - - - - - - - - - - - - - -
# If You Come From Bash You Might Have To Change Your $PATH.
# export PATH=:/usr/local/bin:/usr/local/sbin:$HOME/bin:$PATH
export PATH="$HOME/bin:/usr/local/bin:$PATH"

export GPG_TTY=$(tty)

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=C

alias ts="tmux new-session -A -s"

devenv() {
  docker run --rm --privileged -ite REPO=$1 --mount source=devenv,target=/home/thomas/workspace -v /var/run/docker.sock:/var/run/docker.sock tstachl/devenv
}
