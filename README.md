# 🚀 Arch Linux Setup - darkdev ("De Papayita")

Este repositorio contiene la Infraestructura como Código (IaC) para levantar mi entorno de desarrollo backend de élite en Arch Linux desde cero en menos de 30 minutos. Optimizado para alto rendimiento, estética **Tokyo Night** y ergonomía **Dvorak**.

## 🖥️ Hardware Objetivo
* **Host:** Dell Latitude 5440 (i7 13th Gen, 32GB RAM)
* **Teclado:** QMK Dvorak con Home Row Mods (A/S como Mod4).
* **Monitores:** Triple pantalla (1080p, 4K, 2K Vertical).
* **Entorno:** Sway (Wayland) + Alacritty + Tmux + Starship + Docker.

---

## 🛠️ Paso a Paso: El Día Cero (Instalación de Base)

### 1. Preparación y Arranque
1. Conectar USB booteable con Arch Linux.
2. Iniciar en modo **UEFI** (F12 en Dell).
3. Conectar Wi-Fi si es necesario:
   ```bash
   iwctl station wlan0 connect "TU_RED_WIFI" 
	```

### 2. El Instalador Mágico
* **Ejecuta:** archinstall y configura:
* **Disk configuration:** ext4 o btrfs -> Yes, format.
* **Bootloader:** systemd-boot.
* **Profile:** Minimal.
* **Audio:** Pipewire.
* **Network:** NetworkManager.
* **User account:** darkdev (sudo habilitado).
* 🚨 **Additional packages:** Escribe git y neovim.


## Paso a Paso: El Despliegue de Élite
Una vez reiniciado e iniciada la sesión como darkdev, ejecuta las dos fases del despliegue:

### Fase 1: Sistema Base y Estética Senior
Este script instala la terminal Alacritty, fuentes Nerd Fonts, Starship, Zsh con plugins y vincula tus configuraciones (dotfiles) mediante enlaces simbólicos.

Bash
```
git clone [https://github.com/TU_USUARIO/arch-setup.git](https://github.com/TU_USUARIO/arch-setup.git)
cd arch-setup
chmod +x 01_install_base.sh
./01_install_base.sh
```
    
Reinicia con reboot para entrar en Sway.

### Fase 2: Arsenal de Desarrollo
Instala IntelliJ Ultimate, Docker, DBeaver, Lazygit y herramientas de Devcontainers.

Bash
```
cd arch-setup
chmod +x 02_install_dev.sh
./02_install_dev.sh
```

⌨️ Manual de Operación (Nivel Senior)
Tu sistema está diseñado para que nunca sueltes el teclado.

1. Control del Entorno (Sway + Dvorak)
La tecla Mod es mantener presionada la A (Home Row Mod).

Terminal: Mod + Enter

Lanzador de Apps: Mod + E (Wofi)

Navegación entre ventanas: Mod + D, H, T, N (Tu Fila Central)

Cerrar Ventana: Mod + Shift + Q

2. Terminal Inteligente (Zsh + Rust)
Salto de Carpeta: z [nombre] (Zoxide aprende tus rutas).

Buscador Histórico: Ctrl + R (FZF interactivo).

Buscador de Archivos: Ctrl + T.

Git UI: lazygit (Interfaz ultra-rápida).

Ayuda Rápida: ayuda (Muestra tu cheatsheet personalizada).

3. Tmux (Gestión de Sesiones)
Usa los macros de tu capa _DEV en el teclado QMK para:

MC_DV / MC_DH: Dividir pantalla (Vertical/Horizontal).

MC_TMZ: Hacer Zoom al código.

📂 Estructura del Repositorio
01_install_base.sh: Script de base y estética.

02_install_dev.sh: Script de herramientas de desarrollo.

config/: Archivos .toml de Alacritty y Starship, y config de Sway.

zshrc / tmux.conf: Configuraciones de shell y multiplexor (se vinculan como archivos ocultos).

README.md: Este manual.

Desarrollado con ❤️ por darkdev.


### 💡 Un último consejo de Senior:
Recuerda que para que el `git clone` funcione, debes cambiar `TU_USUARIO/TU_REPOSITORIO` por los tuyos reales. 

Ya tienes todo:
1. El **Hardware** configurado.
2. El **Software** (Scripts 01 y 02) optimizado.
3. La **Estética** (Alacritty/Starship) coherente.
4. La **Documentación** (README) clara.

**¿Te gustaría que te ayude con algo más o ya estás listo para el "gran encendido" en tu Arch Linux?**
