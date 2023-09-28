# assumes a volume mounted at /workspace
export HOME="/workspace"
cd $HOME

# system installations
apt update
apt install zsh fzf vim -y
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# python installations
pip install git+https://github.com/huggingface/transformers.git@main accelerate peft tqdm transformers datasets wandb flash-attn pandas

# git config
git config --global user.email "wongjingping@gmail.com"
git config --global user.name JP
git config --global core.sshCommand "ssh -i /root/.ssh/id_rsa_runpod"

# pull dot files
cd /root
git clone git@github.com:wongjingping/dotfiles.git
cp dotfiles/zshrc_runpod .zshrc # no need to symlink since config is ephemeral


# the rest below needs to handled interactively 
# huggingface-cli login
# wandb login