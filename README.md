# My Dotfiles managed by YADM

## Getting Setup on a new Machine
```
# Add important dependencies ...
sudo apt-get update -y \
  && sudo apt-get upgrade -y \
  && sudo apt-get install -y git zsh vim tmux curl gpg \
  && sudo curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm && sudo chmod a+x /usr/local/bin/yadm \
  && yadm clone https://github.com/tstachl/dotfiles.git

# Change default shell to `zsh`
chsh -s $(which zsh) && zsh

# Decrypt all the goodies
yadm decrypt
```

## Setup script for docker testing
```
# Run a docker container
docker run -it debian:buster-slim
# Setup a user and sign in
apt-get update -y && apt-get install -y sudo \
&& adduser --gecos "" --disabled-password thomas \
&& chpasswd <<<"thomas:password" \
&& usermod -aG sudo thomas \
&& su - thomas
```
