export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="pygmalion"

plugins=(git golang doctl ripgrep gcloud tmux heroku rust docker docker-compose)

# Transparent background support
export TERM=xterm-256color

source $ZSH/oh-my-zsh.sh

alias vi="vim"
alias ls="exa"

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
