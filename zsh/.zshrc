#! /bin/zsh

export PNPM_HOME="/home/dcxo/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

if [ ! -d "$ZPLUG_HOME" ]; then
    echo "ZPLUG not found. Cloning..."
    git clone --depth 1 https://github.com/zplug/zplug "$ZPLUG_HOME"
fi

source $ZDOTDIR/aliases.zsh
source $ZPLUG_HOME/init.zsh
source $ZDOTDIR/plugins.zsh

if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

HISTFILE="$XDG_STATE_HOME"/zsh/history
HISTSIZE=1000
SAVEHIST=1000

setopt INC_APPEND_HISTORY SHARE_HISTORY
