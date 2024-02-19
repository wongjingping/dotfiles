# Dotfiles
Repository for managing and version controlling my dotfiles
  - vimrc
  - zshrc

## Mac
Run `./install_mac.sh <workspace folder>` whenever starting on a new mac machine.

## Runpod (Ubuntu)
Instructions for starting on a new ubuntu instance. Before running this, transfer your ssh key to the instance for interactions with git and all. Replace with the provided port and ip, and your respective ssh keys. We've chained the ssh key transfer and the script execution into one command:
```sh
IP="192.168.1.100"
PORT="30001"
SSH_USER="root"
MY_KEY="${HOME}/.ssh/id_ed25519"
KEY_TO_TRANSFER="${HOME}/.ssh/id_rsa_runpod"
scp -o StrictHostKeyChecking=no -P $PORT -i "${MY_KEY}" "${KEY_TO_TRANSFER}" "${SSH_USER}@${IP}:/${SSH_USER}/.ssh/" && ssh -p $PORT -i "${MY_KEY}" "${SSH_USER}@${IP}" "bash -s" < install_runpod.sh
```
Note that dotfiles and ssh keys are kept in `/root`, while all other user applications and repositories are kept in `/workspace`.

Remember to avoid putting in passwords!
