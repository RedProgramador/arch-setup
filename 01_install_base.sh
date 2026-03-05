#!/usr/bin/env bash

set -euo pipefail

# ==============================================================================
# VALIDACIONES INICIALES
# ==============================================================================

if [[ $EUID -eq 0 ]]; then
  echo -e "\033[0;31m[ERROR] No ejecutes este script como root.\033[0m"
  exit 1
fi

if [[ ! -f /etc/arch-release ]]; then
  echo -e "\033[0;31m[ERROR] Este script es solo para Arch Linux.\033[0m"
  exit 1
fi

REPO_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}==> Iniciando configuración base...${NC}"

# ==============================================================================
# CONFIGURACIÓN BÁSICA Y OPTIMIZACIÓN
# ==============================================================================

echo -e "${BLUE}[1/6] Zona horaria e inicialización${NC}"
sudo timedatectl set-timezone America/Bogota

echo -e "${BLUE}[+] Optimizando Pacman y habilitando TRIM (SSD)...${NC}"
sudo sed -i 's/^#Color/Color/' /etc/pacman.conf
sudo sed -i 's/^#ParallelDownloads = 5/ParallelDownloads = 5/' /etc/pacman.conf
sudo systemctl enable --now fstrim.timer

# ==============================================================================
# ACTUALIZACIÓN DEL SISTEMA
# ==============================================================================

echo -e "${BLUE}[2/6] Actualizando sistema...${NC}"
sudo pacman -Syu --noconfirm

# ==============================================================================
# INSTALACIÓN DE PAQUETES
# ==============================================================================

echo -e "${BLUE}[3/6] Instalando paquetes base...${NC}"

BASE_PKGS=(
  git base-devel wget curl unzip unrar p7zip bzip2 gzip tar jq
  speedtest-cli flameshot
)

SYSTEM_PKGS=(
  mesa vulkan-intel intel-media-driver
  pipewire pipewire-pulse pipewire-alsa wireplumber
  pavucontrol pamixer ntfs-3g rsync
  alacritty starship ttf-jetbrains-mono-nerd
)

NETWORK_PKGS=(
  networkmanager bluez bluez-utils blueman
)

WAYLAND_PKGS=(
  sway swaybg waybar wofi wl-clipboard cliphist
  mako polkit-gnome zsh swaylock swayidle
  zathura zathura-pdf-mupdf imv wlogout
)

DEV_PKGS=(
  neovim tmux docker docker-compose-plugin
  tailscale keepassxc eza bat zoxide fzf ripgrep
)

sudo pacman -S --needed --noconfirm \
  "${BASE_PKGS[@]}" \
  "${SYSTEM_PKGS[@]}" \
  "${NETWORK_PKGS[@]}" \
  "${WAYLAND_PKGS[@]}" \
  "${DEV_PKGS[@]}"

# ==============================================================================
# SERVICIOS
# ==============================================================================

echo -e "${BLUE}[4/6] Habilitando servicios...${NC}"

sudo systemctl enable --now NetworkManager.service
sudo systemctl enable --now bluetooth.service
sudo systemctl enable --now docker.service
sudo systemctl enable --now tailscaled.service

sudo usermod -aG docker "$USER"

# ==============================================================================
# PARU (AUR) Y EXTRA
# ==============================================================================

echo -e "${BLUE}[5/6] Verificando Paru...${NC}"

if ! command -v paru &>/dev/null; then
  TMP_DIR=$(mktemp -d)
  git clone https://aur.archlinux.org/paru.git "$TMP_DIR/paru"
  pushd "$TMP_DIR/paru" >/dev/null
  makepkg -si --noconfirm
  popd >/dev/null
  rm -rf "$TMP_DIR"
fi

echo -e "${BLUE}[+] Instalando Brave Browser desde AUR...${NC}"
paru -S --needed --noconfirm brave-bin

# ==============================================================================
# DOTFILES
# ==============================================================================

echo -e "${BLUE}[6/6] Desplegando dotfiles...${NC}"

mkdir -p "$HOME/.config"/{alacritty,sway,waybar,wofi,mako,flameshot}

ln -sf "$REPO_PATH/zshrc" "$HOME/.zshrc"
ln -sf "$REPO_PATH/tmux.conf" "$HOME/.tmux.conf"
ln -sf "$REPO_PATH/config/alacritty/alacritty.toml" "$HOME/.config/alacritty/"
ln -sf "$REPO_PATH/config/sway/config" "$HOME/.config/sway/"
ln -sf "$REPO_PATH/config/starship.toml" "$HOME/.config/"
ln -sf "$REPO_PATH/config/waybar/config" "$HOME/.config/waybar/"
ln -sf "$REPO_PATH/config/waybar/style.css" "$HOME/.config/waybar/"
ln -sf "$REPO_PATH/config/wofi/style.css" "$HOME/.config/wofi/"
ln -sf "$REPO_PATH/config/mako/config" "$HOME/.config/mako/"

cat > "$HOME/.config/flameshot/flameshot.ini" <<EOF
[General]
useGrimAdapter=true
EOF

# ==============================================================================
# SHELL
# ==============================================================================

if [[ "$SHELL" != "$(command -v zsh)" ]]; then
  sudo chsh -s "$(command -v zsh)" "$USER"
fi

# ==============================================================================
# AUTO-ARRANQUE DE SWAY
# ==============================================================================

echo -e "${BLUE}[+] Configurando auto-arranque de Sway en TTY1...${NC}"

cat > "$HOME/.zprofile" << 'EOF'
# Auto-iniciar Sway al loguearse en la TTY1
if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  exec sway
fi
EOF

echo -e "${GREEN}✔ Instalación completada. Reinicia el sistema.${NC}"
