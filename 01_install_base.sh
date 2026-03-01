#!/bin/bash

# ==============================================================================
# SEGURO ANTI-ROOT: Un Senior no corre el script base con sudo ;)
# ==============================================================================
if [ "$EUID" -eq 0 ]; then
  echo -e "\033[0;31m[ERROR] Por favor, NO ejecutes este script con sudo. Ejecútalo como tu usuario normal.\033[0m"
  exit 1
fi

REPO_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}[1/2] Iniciando Base y Despliegue de Configuración...${NC}"

# 1. Base + Compresión + Herramientas de tus Alias
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm git base-devel wget curl unzip unrar p7zip bzip2 gzip tar jq speedtest-cli flameshot

# 2. Drivers, Audio y Terminal
sudo pacman -S --needed --noconfirm mesa vulkan-intel intel-media-driver pavucontrol pamixer ntfs-3g rsync alacritty starship ttf-jetbrains-mono-nerd

# 3. Sway y Plugins ZSH
sudo pacman -S --needed --noconfirm sway swaybg waybar wofi wl-clipboard mako polkit-gnome zsh zsh-autosuggestions zsh-syntax-highlighting

# 4. Docker y Seguridad
sudo pacman -S --needed --noconfirm neovim tmux docker docker-compose tailscale keepassxc
sudo systemctl enable docker.service
sudo systemctl enable tailscaled.service
sudo usermod -aG docker "$USER"

# 5. Paru (AUR)
if ! command -v paru &> /dev/null; then
    echo -e "${GREEN}[+] Compilando Paru...${NC}"
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    (cd /tmp/paru && makepkg -si --noconfirm)
    rm -rf /tmp/paru
fi

# 6. Dotfiles con Enlaces Reales (Filosofía Stateless Workstation)
echo -e "${GREEN}[+] Desplegando Night Owl Config en $HOME...${NC}"

# Usamos $HOME explícitamente para asegurar que vaya a tu usuario
mkdir -p "$HOME/.config/alacritty" "$HOME/.config/sway" "$HOME/.config/waybar" "$HOME/.config/wofi"

# Enlaces base
ln -sf "$REPO_PATH/zshrc" "$HOME/.zshrc"
ln -sf "$REPO_PATH/tmux.conf" "$HOME/.tmux.conf"
ln -sf "$REPO_PATH/config/alacritty/alacritty.toml" "$HOME/.config/alacritty/alacritty.toml"
ln -sf "$REPO_PATH/config/sway/config" "$HOME/.config/sway/config"
ln -sf "$REPO_PATH/config/starship.toml" "$HOME/.config/starship.toml"

# Nuevos enlaces para la Barra y el Buscador
ln -sf "$REPO_PATH/config/waybar/config" "$HOME/.config/waybar/config"
ln -sf "$REPO_PATH/config/waybar/style.css" "$HOME/.config/waybar/style.css"
ln -sf "$REPO_PATH/config/wofi/style.css" "$HOME/.config/wofi/style.css"

# 7. Cambiar Shell a Zsh
sudo chsh -s "$(which zsh)" "$USER"

echo -e "${GREEN}Fase 1 OK. Configuraciones enlazadas correctamente.${NC}"
