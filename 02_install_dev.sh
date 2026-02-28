#!/bin/bash
# ==============================================================================
# Script 02: Entorno de Desarrollo Empresarial
# ==============================================================================

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}[2/2] Instalando el arsenal de Desarrollo...${NC}\n"

# 1. Herramientas Empresariales (AUR)
echo -e "${GREEN}[+] Instalando IDEs y Clientes API...${NC}"
# Nota: dbeaver-ee es excelente, pero recuerda que requiere licencia.
paru -S --needed --noconfirm intellij-idea-ultimate-edition dbeaver-ee-bin bruno-bin lazygit-bin

# 2. Utilidades para Devcontainers y Python
echo -e "${GREEN}[+] Instalando Devcontainer CLI, Node y Pipx...${NC}"
sudo pacman -S --needed --noconfirm python-pip python-pipx nodejs npm
sudo npm install -g @devcontainers/cli

# 3. Limpieza de caché de instalación
paru -Sc --noconfirm

echo -e "\n${GREEN}====================================================${NC}"
echo -e "${GREEN}¡SISTEMA COMPLETAMENTE LISTO, ARQUITECTO! 🚀${NC}"
echo -e "Configuración: QMK Dvorak + Tokyo Night Theme."
echo -e "${GREEN}====================================================${NC}"
