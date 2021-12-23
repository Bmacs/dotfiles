# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi

if [ -e /home/bmacs/.nix-profile/etc/profile.d/nix.sh ]; then . /home/bmacs/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

#exports
export LC_ALL="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"

#aliases
alias g='git'
