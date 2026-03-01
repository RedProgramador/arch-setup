#!/bin/bash
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}[2/2] Instalando Arsenal de Desarrollo...${NC}"

# 1. IDEs y Navegador
paru -S --needed --noconfirm brave-bin intellij-idea-ultimate-edition dbeaver-ee-bin bruno-bin lazygit-bin

# 2. Node y Python para Big Data
sudo pacman -S --needed --noconfirm python-pip python-pipx nodejs npm
sudo npm install -g @devcontainers/cli

# 3. SDKMAN (Para Java/Kotlin en Big Data)
if [ ! -d "$HOME/.sdkman" ]; then
    curl -s "https://get.sdkman.io" | bash
fi

paru -Sc --noconfirm
echo -e "${GREEN}¡SISTEMA LISTO! Perfil: Analítica & Big Data. Tema: Night Owl.${NC}"
