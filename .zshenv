export GPG_TTY=$(tty)

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=C

# use nvm auto
export NVM_AUTO_USE=true

# devenv docker function (dockerized development environment)
devenv() {
  docker run --rm --privileged -ite REPO=$1 --mount source=devenv,target=/home/thomas/workspace -v /var/run/docker.sock:/var/run/docker.sock tstachl/devenv
}

# cloudflared function (dockerized cloudflared binaries)
cloudflared() {
  docker run --rm -itv $HOME/.cloudflared:/root/.cloudflared pilina/cloudflared $@
}

# run deno in docker 
deno() {
  docker run \
    --interactive \
    --tty \
    --rm \
    --publish 1993:1993 \
    --volume $PWD:/app \
    --volume $HOME/.deno:/deno-dir \
    --workdir /app \
    denoland/deno:latest \
    $@
}

# add node_modules bin to path
export PATH="./node_modules/.bin:$PATH"

if [ ! -f "$HOME/.ssh/id_thomas" ]; then
  echo "Don't forget to > yadm decrypt <!"
fi
