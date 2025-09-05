export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="pygmalion"

plugins=(git golang doctl gcloud tmux heroku rust docker docker-compose)

# Transparent background support
export TERM=xterm-256color
export PAGER="most"

# Default to using Bake with Docker Compose
export COMPOSE_BAKE=true

source $ZSH/oh-my-zsh.sh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh
zvm_after_init_commands+=('[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh')

alias vi="nvim"
alias ls="eza"

export PATH=$PATH:~/.npm-global/bin
export PATH=$PATH:~/.cargo/bin
export PATH=$PATH:~/.local/bin
export PATH=$PATH:~/go/bin

# Import colorscheme from 'wal'
if [ -d "$HOME/.cache/wal" ]; then
  cat $HOME/.cache/wal/sequences
fi

export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

export GPG_TTY=$(tty)

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
