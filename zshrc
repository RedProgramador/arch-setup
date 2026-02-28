# ~/.zshrc - Configuración Senior de darkdev

# ==============================================================================
# 1. ENTORNO Y EXPORTACIONES
# ==============================================================================
export LANG=en_US.UTF-8
export EDITOR='nvim'
export VISUAL='nvim'
export PATH="$HOME/.local/bin:$PATH:/usr/sbin:/sbin"
export PATH="$HOME/.npm-global/bin:$PATH"

# ==============================================================================
# 2. OPTIMIZACIÓN DEL HISTORIAL
# ==============================================================================
HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000
setopt EXTENDED_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

# ==============================================================================
# 3. INTEGRACIONES NATIVAS (Rust)
# ==============================================================================
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# ==============================================================================
# 4. ALIAS DE ALTA EFICIENCIA
# ==============================================================================
alias cd="z"
alias ..="z .."
alias ...="z ../.."
alias ll="eza -lAh --icons --group-directories-first" 
alias l="eza -lh --icons --group-directories-first"
alias tree="eza --tree --icons"

alias update="paru -Syu"
alias install="paru -S"
alias remove="paru -Rns"
alias cat="bat --style=plain"
alias grep='rg'
alias ayuda="bat ~/arch-setup/config/cheatsheet.md"

alias d="docker"
alias dc="docker-compose"
alias dps="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'"
alias ddev="devcontainer"

alias brave="brave > /dev/null 2>&1 &"
alias idea="intellij-idea-ultimate-edition > /dev/null 2>&1 &"
alias fs="flameshot gui"
alias speed="speedtest -f json | jq '.download.bandwidth |= (. * 8 / 1000000 * 100 | round / 100) | .upload.bandwidth |= (. * 8 / 1000000 * 100 | round / 100) | .ping.latency |= (. * 10 | round / 10)'"

# ==============================================================================
# 5. FUNCIONES INTELIGENTES
# ==============================================================================
mkcd() { mkdir -p "$1" && z "$1"; }

extract() {
  if [ -f "$1" ] ; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"     ;;
      *.tar.gz)    tar xzf "$1"     ;;
      *.bz2)       bunzip2 "$1"     ;;
      *.rar)       unrar e "$1"     ;;
      *.gz)        gunzip "$1"      ;;
      *.tar)       tar xf "$1"      ;;
      *.tbz2)      tar xjf "$1"     ;;
      *.tgz)       tar xzf "$1"     ;;
      *.zip)       unzip "$1"       ;;
      *.7z)        7z x "$1"        ;;
      *)           echo "'$1' no soportado." ;;
    esac
  else
    echo "'$1' no es válido."
  fi
}

# ==============================================================================
# 6. AUTOCOMPLETADO Y PLUGINS (La magia visual)
# ==============================================================================
# Activar el autocompletado avanzado (Tab)
autoload -Uz compinit
compinit

# Cargar plugins de Arch Linux (Sugerencias grises y resaltado de sintaxis)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
