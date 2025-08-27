# ==============================================================
# ~/.zshrc
# --------------------------------------------------------------
# Configuración personal de Zsh
# - Tema: Powerlevel10k
# - Plugins: git, zsh-autosuggestions, zsh-syntax-highlighting
# - Alias personalizados y variables de entorno
# --------------------------------------------------------------
# Autor: JosemiGT
# ==============================================================

# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ===============================
# Oh My Zsh
# ===============================
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# ===============================
# Historial
# ===============================
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=".zsh_history"
setopt appendhistory
setopt sharehistory
setopt histignoredups

# ===============================
# Corrección y completado
# ===============================
ENABLE_CORRECTION="true"
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# ===============================
# Variables de entorno
# ===============================
export LANG=es_ES.UTF-8
export EDITOR=helix
export LESS=-R

# Node & FNM
export PATH="$HOME/.local/share/fnm:$PATH"

if command -v fnm >/dev/null 2>&1; then
  eval "$(fnm env --use-on-cd --shell zsh 2>/dev/null)"
fi

# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Homebrew
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"

if command -v brew &>/dev/null; then
  eval "$(brew shellenv)"
fi

# ===============================
# Aliases
# ===============================
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ziplife="$HOME/life/zip-life.sh"
alias unziplife="$HOME/life/unzip-life.sh"

# ===============================
# Powerlevel10k
# ===============================
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
