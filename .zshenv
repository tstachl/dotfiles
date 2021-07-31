export GPG_TTY=$(tty)

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=C

# tmux alias
alias ts="tmux new-session -A -s"
# ssh aliases for cluster
for x in 1 2 3 4 5 6 7 8; do alias "pi$x"="ssh -i ~/.ssh/id_thomas thomas@pilina-0$x.local"; done
# devenv docker function (dockerized development environment)
devenv() {
  docker run --rm --privileged -ite REPO=$1 --mount source=devenv,target=/home/thomas/workspace -v /var/run/docker.sock:/var/run/docker.sock tstachl/devenv
}
# cloudflared function (dockerized cloudflared binaries)
cloudflared() {
  docker run --rm -itv $HOME/.cloudflared:/root/.cloudflared pilina/cloudflared $@
}
