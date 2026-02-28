## 2. ⚡ Lazygit (Interfaz Git)
**Comando para abrir:** `lazygit`

| Tecla | Acción |
| :--- | :--- |
| `Espacio` | Hacer **Stage/Unstage** de un archivo (lo pone en verde). |
| `c` | Hacer **Commit** (Se abre editor para mensaje). |
| `P` (Mayús+p) | Hacer **Push** al remoto. |
| `p` (minúscula) | Hacer **Pull**. |
| `Enter` | Entrar en un archivo para ver el "diff" (cambios línea por línea). |
| `[` / `]` | Moverse entre paneles (Status, Files, Branches, Commits). |
| `x` | Abrir el menú de opciones avanzadas para el panel actual. |
| `?` | Abrir el menú de ayuda (atajos específicos del panel). |
| `q` / `Esc` | Salir de Lazygit. |

---

## 3. 🔍 FZF (Buscador Difuso en Rust)
**El cerebro de tu terminal. No busques, encuentra.**

| Atajo | Acción | Por qué usarlo |
| :--- | :--- | :--- |
| **`Ctrl + R`** | **Historial Inteligente** | Busca ese comando de Docker que escribiste hace 3 días escribiendo solo fragmentos. |
| **`Ctrl + T`** | **Buscar Archivos** | Pega la ruta exacta de un archivo en tu comando actual. |
| **`Alt + C`** | **Saltar a Carpeta** | Busca un directorio y hace `cd` automáticamente hacia él. |
| **`**` + `Tab`** | **Autocompletar Pro** | Ej: Escribe `kill -9 **` + `Tab` para abrir una lista interactiva de procesos a matar. |

---

## 4. 🤠 Ranger (Explorador de Archivos)
**Comando para abrir:** `ranger`
*(Nota Senior: Ranger usa `hjkl` por defecto. Al usar Dvorak, te recomiendo usar las flechas de tu capa `_NAV` para moverte sin perder la memoria muscular).*

| Tecla / Capa | Acción |
| :--- | :--- |
| `Flechas _NAV` | Moverse (Izquierda, Abajo, Arriba, Derecha). |
| `l` o `Flecha Der`| **Entrar** en carpeta o **Abrir** archivo. |
| `h` o `Flecha Izq`| **Volver** a la carpeta anterior. |
| `Espacio` | Seleccionar archivo (puedes seleccionar varios en amarillo). |
| `yy` | Copiar archivo (Copy). |
| `dd` | Cortar archivo (Cut). |
| `pp` | Pegar archivo (Paste). |
| `cw` | Renombrar archivo (Change Word). |
| `S` (Mayús+s) | Abrir una terminal en la carpeta actual. |
| `zh` | Mostrar/Ocultar archivos ocultos (dotfiles). |
| `q` | Salir de Ranger. |

---

## 5. 🚀 Zsh, Starship & Zoxide Tips
**Tu shell moderna y optimizada.**

| Comando / Atajo | Acción |
| :--- | :--- |
| `z [nombre]` | **Magia de Zoxide:** Salta a cualquier carpeta visitada antes. Ej: `z agro` te lleva a `/var/www/agrokilo`. |
| `Flecha Derecha` | **Aceptar sugerencia** (el autocompletado gris basado en tu historial). |
| `Tab` | Autocompletar comandos, ramas de git o rutas. |
| `Ctrl + L` | Limpiar pantalla (mucho más rápido que escribir `clear`). |
| `!!` | Repite el último comando (Ej: `sudo !!` si olvidaste permisos). |
| `mkcd [ruta]` | Función: Crea la carpeta y entra en ella al mismo tiempo. |
| `extract [archivo]` | Función: Descomprime cualquier archivo (.zip, .tar.gz, .rar) automáticamente. |

---

## 6. 🖥️ Control Maestro (Sway + QMK Dvorak)
**Tus herramientas de hardware y sistema gráfico.**

### A. Sway (Capa Base del Sistema)
*La tecla `Mod` es mantener presionada la `A` (izq) o la `S` (der) gracias a tus Home Row Mods.*

| Atajo | Acción |
| :--- | :--- |
| `Mod` + `Enter` | Abrir nueva terminal (Alacritty). |
| `Mod` + `D` | Abrir menú de aplicaciones (Wofi). |
| `Mod` + `H/T/C/N` | **Mover foco** (Izquierda, Abajo, Arriba, Derecha en Dvorak). |
| `Mod` + `Shift` + `H/T/C/N`| **Mover ventana** de posición físicamente. |
| `Mod` + `B` / `V` | Preparar siguiente división en Horizontal o Vertical. |
| `Mod` + `Shift` + `Q` | **Matar/Cerrar** el programa actual. |

### B. Tmux (Capa `_DEV` del Teclado)
*Usando tu capa de hardware dedicada, no necesitas presionar Ctrl+B.*

| Tecla QMK | Acción (Macro de Tmux) |
| :--- | :--- |
| `MC_TNEW` | Crear nueva pestaña. |
| `MC_TKILL` | Cerrar el panel actual. |
| `MC_DV` | Dividir panel verticalmente (Mitad a la derecha). |
| `MC_DH` | Dividir panel horizontalmente (Mitad abajo). |
| `MC_TMZ` | Zoom (Maximizar/Restaurar) el panel actual. |
| `MC_PANE_...` | Navegar entre los paneles (Arriba/Abajo/Izquierda/Derecha). |
