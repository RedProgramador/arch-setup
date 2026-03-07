#!/bin/bash
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}[2/2] Instalando Arsenal de Desarrollo (Licensed Edition)...${NC}"

# 1. IDEs Profesionales (Versiones -bin para mayor estabilidad y rapidez)
# dbeaver-ee es la versión Enterprise que pide tu llave de licencia.
# intellij-idea-ultimate-edition es la que soporta todo el stack de Big Data.
paru -S --needed --noconfirm \
    intellij-idea-ultimate-edition \
    dbeaver-ee \
    bruno-bin \
    lazygit

# 2. Node y Python para Big Data
sudo pacman -S --needed --noconfirm python-pip python-pipx nodejs npm

# 3. Herramientas de Contenedores y CLI
# Instalamos devcontainers vía pipx para no ensuciar el Python del sistema
pipx install @devcontainers/cli || true

# 4. SDKMAN (El corazón de Java/Scala/Kotlin)
if [ ! -d "$HOME/.sdkman" ]; then
    echo -e "${BLUE}[+] Instalando SDKMAN...${NC}"
    curl -s "https://get.sdkman.io" | bash
    # Nota: SDKMAN se activa solo al reiniciar la terminal o haciendo source
fi

paru -Sc --noconfirm
echo -e "${GREEN}¡SISTEMA LISTO! Perfil: Analítica & Big Data. Tema: Night Owl.${NC}"
