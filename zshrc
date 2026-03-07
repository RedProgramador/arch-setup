# ~/.zshrc - Configuración Senior de darkdev

# ==============================================================================
# 1. ENTORNO Y EXPORTACIONES
# ==============================================================================
export LANG=en_US.UTF-8
export EDITOR='nvim'
export VISUAL='nvim'
export TERM=xterm-256color

export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:/usr/sbin:/sbin:$PATH"

export GEMINI_API_KEY="TU_LLAVE_AQUI"
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

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
# 3. INTEGRACIONES NATIVAS
# ==============================================================================
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"
source <(fzf --zsh)

# ==============================================================================
# 4. ALIAS DE ALTA EFICIENCIA
# ==============================================================================
# --- Navegación y Listado ---
alias cd="z"
alias ..="z .."
alias ...="z ../.."
alias ll="eza -lAh --icons --group-directories-first" 
alias l="eza -lh --icons --group-directories-first"
alias tree="eza --tree --icons"

# --- Gestión de Paquetes (Arch/AUR) ---
alias update="paru -Syu"
alias install="paru -S"
alias remove="paru -Rns"
alias limpiar="sudo pacman -Rns \$(pacman -Qtdq)"

# --- Herramientas de Sistema ---
alias b="btop"                   # Monitor de recursos rápido
alias f="fastfetch"              # Info del sistema rápida
alias cat="bat --style=plain"
alias grep='rg'
alias ayuda="bat ~/arch-setup/config/cheatsheet.md"
alias cat="bat --style=plain"

# --- Docker ---
alias d="docker"
alias dc="docker-compose"
alias dps="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}'"
alias ddev="devcontainer"

# --- Red y Apps ---
alias brave="brave > /dev/null 2>&1 &"
alias idea="/opt/intellij-idea/idea-IU-252.23892.409/bin/idea.sh > /dev/null 2>&1 &"
alias fs="flameshot gui"
alias speed="speedtest -f json | jq '.download.bandwidth |= (. * 8 / 1000000 * 100 | round / 100) | .upload.bandwidth |= (. * 8 / 1000000 * 100 | round / 100) | .ping.latency |= (. * 10 | round / 10) | .download.latency.iqm |= (. * 10 | round / 10)'"
alias ip-local="ip -color -br a"
alias ip-publica="curl ifconfig.me ; echo"

# --- Git (Esenciales para Senior) ---
alias gs="git status"
alias gp="git push"
alias gl="git pull"
alias gc="git commit -m"
alias ga="git add ."

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
      *.zip)       unzip "$1"       ;;
      *.7z)        7z x "$1"        ;;
      *)           echo "'$1' no soportado." ;;
    esac
  else
    echo "'$1' no es un archivo válido."
  fi
}

# ==============================================================================
# 6. AUTOCOMPLETADO Y PLUGINS (¡ORDEN CORREGIDO!)
# ==============================================================================

# Limpiamos el terminal y mostramos el sistema al entrar
clear
fastfetch

autoload -Uz compinit && compinit

# Sugerencias primero
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'

# Resaltado de sintaxis estrictamente al final
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
