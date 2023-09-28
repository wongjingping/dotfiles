# before running this, transfer your ssh key to this instance for interactions with git and all
# replace with the provided port and ip, and your respective ssh keys
# scp -P 30001 -i ~/.ssh/id_ed25519 .ssh/id_rsa_runpod* root@192.168.1.100:~/.ssh
# then run this script:
# ssh -p 30001 root@192.168.1.100 "bash -s" < dotfiles/runpod_setup.sh

# assumes a volume mounted at /workspace
export HOME="/workspace"
cd $HOME

# system installations
apt update
apt install vim -y
apt install zsh
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# python installations
pip install git+https://github.com/huggingface/transformers.git@main accelerate peft tqdm transformers datasets wandb flash-attn pandas

# git config
git config --global user.email "wongjingping@gmail.com"
git config --global user.name JP
git config --global core.sshCommand "ssh -i /root/.ssh/id_rsa_runpod"

# pull dot files
git clone git@github.com:wongjingping/dotfiles.git
rm .zshrc
./dotfiles/install.sh /workspace

# the rest below needs to handled interactively 
# huggingface-cli login
# wandb login