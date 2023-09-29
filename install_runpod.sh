# assumes a volume mounted at /workspace
export HOME="/workspace"
cd $HOME

# system installations
apt update
apt install git-lfs screen zsh fzf vim -y
chsh -s /usr/bin/zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# python installations
pip install git+https://github.com/huggingface/transformers.git@main accelerate bitsandbytes peft sentence_transformers sqlparse tqdm transformers datasets wandb flash-attn pandas

# git config
git config --global user.email "wongjingping@gmail.com"
git config --global user.name JP
git config --global core.sshCommand "ssh -i /root/.ssh/id_rsa_runpod"

cd /root
# add github's host ip to known hosts to avoid interactive prompt when cloning
ssh-keyscan -H github.com >> .ssh/known_hosts
# pull dot files
git clone git@github.com:wongjingping/dotfiles.git
cp dotfiles/zshrc_runpod .zshrc # no need to symlink since config is ephemeral


# the rest below needs to handled interactively 
# huggingface-cli login
# wandb login