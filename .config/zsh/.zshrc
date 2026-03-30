export ZSH="$HOME/.config/zsh/oh-my-zsh"
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# export ZDOTDIR="$HOME/.config/zsh"


ZSH_THEME="robbyrussell"

plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	history
	extract
	sudo
)

source $ZSH/oh-my-zsh.sh

export EDITOR="nvim"
export MANPAGER="nvim +Man!"

# Example aliases
alias ..="cd .."
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias vim="nvim"
alias c='clear'
alias q='exit'
alias zshr='nvim ~/.config/zsh/.zshrc'
alias ff='fastfetch'
alias neofetch='fastfetch'
alias stfu='shutdown now'
alias i3wm='nvim ~/.config/i3/config'
alias swaywm='nvim ~/.config/sway/config'
alias n='nvim'
alias nt='nvim +terminal'
alias n.='nvim .'
alias dbt='dmenu-bluetooth'
alias s='syncthing'
alias stow\ .="stow --adopt ."
alias brr='brave-browser'
alias gpp='g++'
alias bravew="brave --ozone-platform=wayland"
alias discordupdate="sudo nvim /opt/discord/resources/build_info.json"
alias aesprite="~/Programs/aseprite/build/bin/aseprite"

# Starship prompt
eval "$(starship init zsh)"
# Initialize zoxide
eval "$(zoxide init zsh)"

#vi mode
bindkey -v

if command -v tmux >/dev/null 2>&1; then
    [ -z "$TMUX" ] && exec tmux
fi

# nvim() {
#   tmux set-option -g status-style "bg='#000000'"
#   command nvim "$@"
#   tmux set-option -g status-style "bg=#1e1e2e"
# }

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]]; then
    echo -ne '\e[1 q'  # block cursor (focus)
  else
    echo -ne '\e[5 q'  # beam cursor (typing)
  fi
}
zle -N zle-keymap-select

