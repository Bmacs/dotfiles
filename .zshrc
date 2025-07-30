## Bmacs' ZSH Config

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
export PATH="/Users/bmacs/.local/bin:$PATH"
export PATH="/usr/local/opt/AVRToolchain/bin:$PATH"
export PATH="/Users/bmacs/.cargo/bin:$PATH"

alias vim=nvim

USE_POWERLINE="true"

# vim mode
#bindkey -v

## ALIASES
alias batt='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -i "percentage\|state"'
alias chat='pushd ~/alpaca/alpaca.cpp/alpaca.cpp/; ./chat; popd'
alias ls='lsd'
#alias cat='bat'
alias zls='zellij list-sessions'
alias z='zellij attach bmacs'
alias za='zellij attach bmacs'
alias zl='zellij list-sessions'
alias zd='zellij d --force'
alias zj='zellij'
#alias cd='z'

# Run on start
zellij list-sessions
zellij action list-clients


export windows=A0:36:BC:3D:87:6C
export windows_sleep=6C:87:3D:BC:36:A0


# Enable colors and change prompt:
autoload -U colors && colors

PS1="%B%{$fg[red]%}[%{$fg[green]%}%n%{$fg[cyan]%}@%{$fg[blue]%}%m %{$fg[magenta]%}%~%{$fg[red]%}]%{$fg[black]%}$:%b "
# History in cache directory:
HISTSIZE=100000
SAVEHIST=100000
HISTDUP=erase
HISTFILE=~/.zsh_history
setopt append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_find_no_dups

bindkey '^k' history-search-backward
bindkey '^j' history-search-forward
#bindkey '^Z' 'zellij attach bmacs\n'


# Basic auto/tab complete:
autoload -Uz compinit
setopt CORRECT
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.

export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

test -e /Users/bmacs/.iterm2_shell_integration.zsh && source /Users/bmacs/.iterm2_shell_integration.zsh || true

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# ZINIT

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit snippet OMZP::git

zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls $realpath'

autoload -U compinit && compinit


export PATH=$PATH:/Users/bmacs/.spicetify
