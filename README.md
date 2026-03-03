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

## requirements

```bash
sudo pacman -S git stow
```

## install

```bash
git clone https://github.com/amdkits/dotfiles.git ~/dotfiles
cd ~/dotfiles
stow --target=$HOME .
```

## notes

- `obsidian/` excludes workspace state and cache via `.gitignore`
- `weechat/sec.conf` is excluded — contains credentials
