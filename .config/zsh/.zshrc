if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$ZDOTDIR/ohmyzsh"

ZSH_THEME="powerlevel10k/powerlevel10k" # set by `omz`

plugins=(git fzf archlinux history thefuck)

source $ZSH/oh-my-zsh.sh

source /home/parashurama/Programs/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/parashurama/Programs/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

alias p10='nvim ~/.config/zsh/.p10k.zsh'
alias c='clear'
alias q='exit'
alias zshr='nvim ~/.config/zsh/.zshrc'
alias ff='fastfetch'
alias stfu='sudo shutdown now'
alias i3wm='nvim ~/.config/i3/config'
alias n='nvim'
alias nt='nvim +terminal'
alias n.='nvim .'
alias loginsql='mysql -u amdkits -p'
alias bt='bluetoothctl'
alias dbt='dmenu-bluetooth'
alias s='syncthing'
alias p='python3'

eval "$(zoxide init zsh)"
