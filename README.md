# dotfiles
i use arch btw

## structure
```
~/.dotfiles/
├── .config/
│   ├── aseprite/       # pixel art editor prefs & keybinds
│   ├── i3/             # i3 window manager config
│   ├── mpv/            # mpv media player config
│   ├── nvim/           # neovim (lua config, lazy.nvim)
│   ├── obsidian/       # obsidian vault settings
│   ├── sway/           # sway wayland compositor
│   ├── starship/       # starship prompt
│   ├── waybar/         # wayland status bar
│   ├── weechat/        # irc client config
│   └── zsh/            # zsh config
└── .tmux.conf          # tmux config
```

## install

```bash
git clone https://github.com/amdkits/dotfiles.git ~/dotfiles
cd ~/dotfiles
bash install.sh
```

the script handles everything: yay, all packages (pacman + aur), oh-my-zsh, zsh plugins, stow, shell change, and ZDOTDIR.

## post-install

enable services:
```bash
sudo systemctl enable --now tailscaled NetworkManager syncthing docker
```

on first nvim launch:
```
:TSInstall
```

## requirements (what the script installs)

| category | packages |
|---|---|
| shell | zsh, starship, zoxide, oh-my-zsh, zsh-autosuggestions, zsh-syntax-highlighting |
| terminal | ghostty, tmux |
| editor | neovim, tree-sitter-cli, nodejs, npm, gcc, clang, stylua, prettier |
| fonts | ttf-dejavu, ttf-roboto, ttf-ubuntu, noto-fonts-cjk, 0xproto-nerd, powerline-fonts |
| x11 | i3-wm, i3status, i3lock, dmenu, rofi, picom, feh, flameshot |
| wayland | sway, waybar, swaybg, swayidle, swaylock-effects, grim, slurp, wl-clipboard, bemenu |
| audio | pipewire, wireplumber, pavucontrol, alsa-utils |
| creative | gimp, inkscape, krita, blender, aseprite, libresprite |
| dev | gdb, lldb, cmake, bear, go, rust, python, docker, mongodb |
| reading | zathura, calibre, sioyek, epr, kcc |
| communication | weechat, catgirl, signal, telegram |
| browser | librewolf, brave |
| network | tailscale, tor, proton-vpn, cloudflare-warp, windscribe, mosh |
| misc | yazi, pass, syncthing, mpv, yt-dlp, btop, fastfetch, fzf, yay |

## notes
- `obsidian/` excludes workspace state and cache via `.gitignore`
- `weechat/sec.conf` is excluded — contains credentials
- nvim plugins install automatically on first launch via lazy.nvim
- artix users: replace `systemctl` with the appropriate init system commands
