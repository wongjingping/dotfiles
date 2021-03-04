# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/jingpingw/.oh-my-zsh"

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

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

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
