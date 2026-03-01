#!/bin/bash
REPO_PATH=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}[1/2] Iniciando Base...${NC}"

# 1. Base + Compresión + Herramientas de tus Alias (jq, speedtest, flameshot)
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
sudo usermod -aG docker $USER

# 5. Paru (AUR)
if ! command -v paru &> /dev/null; then
    git clone https://aur.archlinux.org/paru.git /tmp/paru
    (cd /tmp/paru && makepkg -si --noconfirm)
    rm -rf /tmp/paru
fi

# 6. Dotfiles con Enlaces Reales (Filosofía Stateless Workstation)
echo -e "${GREEN}[+] Desplegando Night Owl Config...${NC}"
# Creamos todas las carpetas necesarias de un solo golpe
mkdir -p ~/.config/alacritty ~/.config/sway ~/.config/waybar ~/.config/wofi

# Enlaces simbólicos de tu repositorio al sistema
ln -sf "$REPO_PATH/zshrc" ~/.zshrc
ln -sf "$REPO_PATH/tmux.conf" ~/.tmux.conf
ln -sf "$REPO_PATH/config/alacritty/alacritty.toml" ~/.config/alacritty/alacritty.toml
ln -sf "$REPO_PATH/config/sway/config" ~/.config/sway/config
ln -sf "$REPO_PATH/config/starship.toml" ~/.config/starship.toml

# Nuevos enlaces para la estética de la Barra y el Buscador
ln -sf "$REPO_PATH/config/waybar/config" ~/.config/waybar/config
ln -sf "$REPO_PATH/config/waybar/style.css" ~/.config/waybar/style.css
ln -sf "$REPO_PATH/config/wofi/style.css" ~/.config/wofi/style.css

# 7. Cambiar Shell a Zsh
sudo chsh -s $(which zsh) $USER

echo -e "${GREEN}Fase 1 OK. Reinicia.${NC}"
