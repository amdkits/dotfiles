#!/bin/bash
set -e

# ============================================================
# dotfiles install script
# for arch-based systems (arch, artix, manjaro, etc.)
# ============================================================

# ── helpers ──────────────────────────────────────────────────
pacin() { sudo pacman -S --needed --noconfirm "$@"; }
yayin() { yay -S --needed --noconfirm "$@"; }

# ── yay ──────────────────────────────────────────────────────
echo "==> installing yay"
pacin base-devel git
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay && makepkg -si --noconfirm && cd -

# ── base ─────────────────────────────────────────────────────
echo "==> base tools"
pacin stow curl wget rsync unzip zip tree fd fzf jq

# ── shell ────────────────────────────────────────────────────
echo "==> shell"
pacin zsh starship zoxide bash-completion

echo "==> oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

echo "==> zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions \
  ~/.config/zsh/oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting \
  ~/.config/zsh/oh-my-zsh/custom/plugins/zsh-syntax-highlighting

echo "==> setting ZDOTDIR"
echo 'export ZDOTDIR="$HOME/.config/zsh"' | sudo tee -a /etc/zsh/zshenv

echo "==> setting zsh as default shell"
chsh -s $(which zsh)

# ── terminal & multiplexer ───────────────────────────────────
echo "==> terminal"
pacin ghostty tmux

# ── editor ───────────────────────────────────────────────────
echo "==> neovim"
pacin neovim tree-sitter-cli nodejs npm gcc clang stylua prettier

# ── fonts ────────────────────────────────────────────────────
echo "==> fonts"
pacin ttf-dejavu ttf-roboto ttf-ubuntu-font-family noto-fonts-cjk powerline-fonts
yayin ttf-0xproto-nerd

# ── window manager (x11) ─────────────────────────────────────
echo "==> i3 (x11)"
pacin i3-wm i3status i3lock dmenu rofi picom feh flameshot xorg-xinit

# ── wayland compositor ───────────────────────────────────────
echo "==> sway (wayland)"
pacin sway swaybg swayidle waybar wl-clipboard grim slurp bemenu wmenu
yayin swaylock-effects-git

# ── audio ────────────────────────────────────────────────────
echo "==> audio"
pacin pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber pavucontrol alsa-utils

# ── display ──────────────────────────────────────────────────
echo "==> display"
pacin brightnessctl xorg-xrandr

# ── file utilities ───────────────────────────────────────────
echo "==> file utilities"
pacin yazi pass syncthing

# ── media ────────────────────────────────────────────────────
echo "==> media"
pacin mpv yt-dlp

# ── documents & reading ──────────────────────────────────────
echo "==> documents"
pacin zathura zathura-epub-mupdf calibre
yayin kcc epr-git sioyek

# ── creative ─────────────────────────────────────────────────
echo "==> creative"
pacin gimp inkscape krita blender
yayin aseprite libresprite

# ── dev tools ────────────────────────────────────────────────
echo "==> dev tools"
pacin gdb lldb cmake bear go rust python312 python-pip docker
yayin mongodb-bin

# ── communication ────────────────────────────────────────────
echo "==> communication"
pacin weechat catgirl
yayin signal-desktop telegram-desktop-bin

# ── browser ──────────────────────────────────────────────────
echo "==> browser"
yayin librewolf-bin brave-bin

# ── network & vpn ────────────────────────────────────────────
echo "==> network"
pacin networkmanager tailscale tor openbsd-netcat mosh
yayin proton-vpn-gtk-app cloudflare-warp-bin windscribe-cli-v2-bin

# ── misc ─────────────────────────────────────────────────────
echo "==> misc"
pacin htop btop fastfetch glow w3m chafa aria2 peaclock
yayin awww bpytop

# ── dotfiles ─────────────────────────────────────────────────
echo "==> cloning dotfiles"
git clone https://github.com/amdkits/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow --target=$HOME .

echo ""
echo "==> done."
echo "    - restart your terminal"
echo "    - on first nvim launch run :TSInstall to install treesitter parsers"
echo "    - enable services:"
echo "      sudo systemctl enable --now tailscaled NetworkManager syncthing docker"
