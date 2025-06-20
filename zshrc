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

# Initialize Homebrew environment (especially important for Apple Silicon)
if [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# User configuration

# my own prompt
autoload -Uz vcs_info
precmd_functions+=( vcs_info )
setopt PROMPT_SUBST
zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:*' enable git

PROMPT="[%{%F{240}%}JP %{%F{255}%}%c %{%F{220}%}\${vcs_info_msg_0_}%{$reset_color%}]$ "

# PATH modifications
export GOPATH="$HOME/workspace/go"
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="${HOME}/.fluvio/bin:${PATH}"
export PATH="${PATH}:$GOPATH/bin"

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
alias godot="cd ~/workspace/dotfiles"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jp/workspace/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jp/workspace/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jp/workspace/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jp/workspace/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# set locale
export LC_ALL=en_US.UTF-8
export LANG=en_EN.UTF-8

# pnpm
export PNPM_HOME="/Users/jp/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jp/workspace/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jp/workspace/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jp/workspace/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jp/workspace/google-cloud-sdk/completion.zsh.inc'; fi

function pull_and_delete_branch() {
    # Save current branch name
    current_branch=$(git rev-parse --abbrev-ref HEAD)

    # Checkout main branch
    git checkout main

    # Pull changes from main
    git pull

    # Delete the saved branch
    git branch -d "$current_branch"
}

alias gdd='pull_and_delete_branch'
