export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

#region ZSH
export ZPLUG_HOME=$ZDOTDIR/zplug
export ZPLUG_CACHE_DIR="$XDG_CACHE_HOME/zsh/zplug"
export ZPLUG_REPOS="$XDG_DATA_HOME/zsh/zplug"
export ZPLUG_BIN="$ZDOTDIR/.bin"
export ZPLUG_THREADS=10
#endregion

#region Rust
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
#endregion

#region JS
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG=$XDG_CONFIG_HOME/npm/npmrc
#endregion


#region Go
export GOPATH="$XDG_DATA_HOME"/go, export GOMODCACHE="$XDG_CACHE_HOME"/go/mod
#endregion

#region Misc
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
#endregion
