# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set theme. More at https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"


# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# my own prompt
autoload -Uz vcs_info
precmd_functions+=( vcs_info )
setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git

PROMPT="[%{%F{240}%}JP %{%F{255}%}%c %{%F{220}%}\${vcs_info_msg_0_}%{$reset_color%}]$ "

# PATH variables
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export GOPATH="$HOME"

# keyboard shortcuts for editing
# bindkey -v
# bindkey "^R" history-incremental-search-backward
bindkey \^U backward-kill-line

# add fzf zsh bindings for history and tab completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# allow editing of commands in vim
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# executable aliases
alias v='vim'
alias t='tree -L 1'

# directory aliases
alias gowp="cd ~/workspace"
alias godot="cd ~/dotfiles"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/jp/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
# else
#     if [ -f "/Users/jp/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/jp/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/jp/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

