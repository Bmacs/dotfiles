## Bmacs' ZSH Config

export PATH="/opt/local/bin:/opt/local/sbin:$PATH"

USE_POWERLINE="true"

## ALIASES
alias batt='upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep -i "percentage\|state"'
alias chat='pushd ~/alpaca/alpaca.cpp/alpaca.cpp/; ./chat; popd'

export windows=A0:36:BC:3D:87:6C
export windows_sleep=6C:87:3D:BC:36:A0


# Enable colors and change prompt:
autoload -U colors && colors

PS1="%B%{$fg[red]%}[%{$fg[green]%}%n%{$fg[cyan]%}@%{$fg[blue]%}%m %{$fg[magenta]%}%~%{$fg[red]%}]%{$fg[black]%}$:%b "
# History in cache directory:
HISTSIZE=100000
SAVEHIST=
#HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)               # Include hidden files.

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.
test -e /Users/bmacs/.iterm2_shell_integration.zsh && source /Users/bmacs/.iterm2_shell_integration.zsh || true
