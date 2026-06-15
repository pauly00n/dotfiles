# powerlevel10k instant prompt (keep near the top)
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ===== PATH =====
if [[ $(uname -m) == 'arm64' ]]; then
    BREWPATH=/opt/homebrew/bin
else
    BREWPATH=/usr/local/bin
fi
export PATH=$BREWPATH:$PATH
export PATH="$HOME/.local/bin:$PATH"

# completion system
autoload -Uz compinit && compinit

# command history 
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=10000
setopt hist_ignore_dups share_history

# environment 
export EDITOR='nvim'
export BAT_THEME="Visual Studio Dark+"

# autosuggestions (must load before the tab widget below)
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# tab: accept autosuggestion if one is shown, else normal completion
_tab_autosuggest() {
  if [[ -n $POSTDISPLAY ]]; then
    zle autosuggest-accept
  else
    zle expand-or-complete
  fi
}
zle -N _tab_autosuggest
bindkey '^I' _tab_autosuggest # huge qol

# aliases 
alias neo="fastfetch"
alias ls="eza --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias oo="z documents paulyoon"
alias cn="cd ~/.config/nvim/lua"
alias cz="nvim ~/.zshrc"
alias n="nvim"
alias cb="cd ../"
alias claud="claude --dangerously-skip-permissions"
alias g="git"

# zoxide
eval "$(zoxide init zsh)"

# powerlevel10k theme 
source ~/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ===== zsh-syntax-highlighting MUST be sourced last =====
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
