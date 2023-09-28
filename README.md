# Dotfiles
Repository for managing and version controlling my dotfiles
  - vimrc
  - zshrc

## Mac
Run `./install_mac.sh <workspace folder>` whenever starting on a new mac machine.

## Runpod (Ubuntu)
Instructions for starting on a new ubuntu instance. Before running this, transfer your ssh key to the instance for interactions with git and all. Replace with the provided port and ip, and your respective ssh keys
```sh
scp -P 30001 -i ~/.ssh/id_ed25519 .ssh/id_rsa_runpod* root@192.168.1.100:~/.ssh
```
Then run this script to install a bunch of stuff including zsh and ohmyzsh:
```sh
ssh -p 30001 root@192.168.1.100 "bash -s" < dotfiles/runpod_setup.sh
```


Remember to avoid putting in passwords!
