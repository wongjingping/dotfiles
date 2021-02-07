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
alias h='history | fzf'

# android env
JAVA_HOME=/Library/Java/JavaVirtualMachines/TwitterJDK11/Contents/Home
ANDROID_HOME="${HOME}/Library/Android/sdk"
ANDROID_SDK=$ANDROID_HOME
LATEST_BUILD_TOOLS=$(ls -t $ANDROID_HOME/build-tools/ | head -n 1)
PATH=$PATH:"$ANDROID_HOME/tools"
PATH=$PATH:"$ANDROID_HOME/platform-tools"
PATH=$PATH:"$ANDROID_HOME/build-tools/$LATEST_BUILD_TOOLS"
export JAVA_HOME ANDROID_HOME PATH
launchctl setenv ANDROID_HOME "$ANDROID_HOME"

source ~/.twitter-android-script # added by Twitter for Android

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
