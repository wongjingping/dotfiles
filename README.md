# Dotfiles
Repository for managing and version controlling my dotfiles
  - vimrc
  - zshrc

## Mac
Run `./install_mac.sh <workspace folder>` whenever starting on a new mac machine.

## Runpod (Ubuntu)
Instructions for starting on a new ubuntu instance. Before running this, transfer your ssh key to the instance for interactions with git and all. Replace with the provided port and ip, and your respective ssh keys
```sh
IP="192.168.1.100"
PORT="30001"
scp -P $PORT -i ~/.ssh/id_ed25519 ~/.ssh/id_rsa_runpod* "root@${IP}:/root/.ssh/"
```
Then run this script to install a bunch of stuff including zsh and ohmyzsh:
```sh
ssh -p $PORT "root@${IP}" "bash -s" < install_runpod.sh
```
Note that dotfiles and ssh keys are kept in `/root`, while all other user applications and repositories are kept in `/workspace`.

Remember to avoid putting in passwords!
