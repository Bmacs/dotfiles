# install nix
curl -L https://nixos.org/nix/install | sh

# source nix
. ~/.nix-profile/etc/profile.d/nix.sh

# install packages
nix-env -iA \
	nixpkgs.imwheel \
	nixpkgs.zsh \
	nixpkgs.stow \
	nixpkgs.yarn \
	nixpkgs.bat \
	nixpkgs.gnumake \
	nixpkgs.gcc \
	nixpkgs.direnv \
	nixpkgs.i3lock \
	nixpkgs.alacritty

stow awesome/.config/awesome
stow imwheel
stow x11
stow zsh

# add zsh as a login shell
command -v zsh | sudo tee -a /etc/shells

# use zsh as default shell
sudo chsh -s $(which zsh) $USER

# install rofi themes
cd ~
command git clone https://github.com/adi1090x/rofi
cd ~/rofi/
command ./setup.sh

