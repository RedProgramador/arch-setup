#!/bin/bash
# ==============================================================================
# Script 01: Sistema Base, Entorno Gráfico y Estética Senior
# ==============================================================================

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}[1/2] Iniciando la instalación del Sistema Base...${NC}\n"

# 1. Sistema base y compresión
sudo pacman -Syu --noconfirm
sudo pacman -S --needed --noconfirm git base-devel wget curl unzip unrar p7zip bzip2 gzip tar jq

# 2. Drivers Intel, Audio y Discos
sudo pacman -S --needed --noconfirm mesa vulkan-intel intel-media-driver pavucontrol pamixer ntfs-3g rsync

# 3. Terminal, Estética y Plugins (AÑADIDOS: alacritty, plugins y fuentes)
sudo pacman -S --needed --noconfirm alacritty eza bat ripgrep fd zoxide btop fastfetch fzf starship ttf-jetbrains-mono-nerd zsh-autosuggestions zsh-syntax-highlighting

# 4. Sway (Wayland) y Utilidades
sudo pacman -S --needed --noconfirm sway swaybg waybar wofi wl-clipboard mako polkit-gnome

# 5. Entorno CLI, Docker y Seguridad
sudo pacman -S --needed --noconfirm neovim tmux zsh docker docker-compose tailscale keepassxc
sudo systemctl enable docker.service
sudo systemctl enable tailscaled.service
sudo usermod -aG docker $USER

# 6. Instalar Paru (Gestor AUR)
if ! command -v paru &> /dev/null; then
    echo -e "${GREEN}[+] Compilando Paru...${NC}"
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    cd /tmp/paru && makepkg -si --noconfirm && cd ~ && rm -rf /tmp/paru
fi

# 7. Brave Browser
paru -S --needed --noconfirm brave-bin

# 8. Despliegue de Dotfiles (MEJORADO: usa enlaces simbólicos ln -sf)
# Un Senior usa links simbólicos para que si editas el archivo en el repo, se actualice el sistema.
echo -e "${GREEN}[+] Desplegando configuraciones...${NC}"
mkdir -p ~/.config/alacritty ~/.config/sway

ln -sf $(pwd)/zshrc ~/.zshrc
ln -sf $(pwd)/tmux.conf ~/.tmux.conf
ln -sf $(pwd)/config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -sf $(pwd)/config/sway/config ~/.config/sway/config
ln -sf $(pwd)/config/starship.toml ~/.config/starship.toml

# 9. Cambiar Shell
chsh -s $(which zsh)

echo -e "\n${GREEN}¡FASE 1 COMPLETADA! Reinicia con 'reboot'.${NC}"
