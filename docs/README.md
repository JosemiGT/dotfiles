# Mi sistema

- Distro: Arch Linux
- Window Manager: Hyprland
- Terminal: Alacritty
- Barra de estado: Waybar
- Lanzador de aplicaciones: Wofi
- Administrador de archivos: Nautilus
- Navegador web: ZenBrowser & Vivaldi
- Administrador de notificaciones: Swaync
- Administrador de fondos de pantalla: Waypaper
- Capturas de pantalla: Hyprshot
- Bloqueo de pantalla: Hyprlock
- Editor de texto: Helix & VSCodium

---

## Dotfiles

Este repositorio contiene mis configuraciones personales (**dotfiles**) gestionadas con un **bare Git repository**, siguiendo la filosofía planteada originalmente [aquí](https://news.ycombinator.com/item?id=11071754).

Me permite mantener los archivos de configuración en `$HOME` y sincronizarlos sin usar enlaces simbólicos.

En el enlace original se explica como iniciar un repositorio de este tipo desde cero, por lo que acontinuación sólo detallaré como replicar este repositorio y como usarlo.

## 💻 Instalación en una nueva máquina

1. Clonar el repositorio como bare repo:

    ```bash
        git clone --bare git@github.com:tuusuario/dotfiles.git $HOME/.dotfiles
    ```

2. Configurar el alias para trabajar con el bare repo, añadir la siguiente línea a ~/.zshrc o ~/.bashrc o tu emulador de terminal correspondiente.

    ```bash
        alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    ```

3. Evitar que Git muestre todos los archivos no rastreados:

    ```bash
        config config --local status.showUntrackedFiles no
    ```

4. Hacer checkout de los archivos versionados:

    ```bash
        config checkout
    ```

> [!Note]
> Si $HOME ya tiene archivos de configuración que puedan causar conflictos, git nos avisará. Si quieres sobreescribirlos puedes ejecutar

```bash
    config checkout -f 
```

## 📁 Estructura recomendada

Se mantiene la misma estructura que convive en mi directorio $HOME, ya que se está mapeando como árbol de trabajo en el repositorio, más o menos es la siguiente:

- Los archivos de shell y de algunas aplicaciones más antiguas están en la raíz de $HOME, como: .zshrc, .bashrc, .profile, .vimrc, .tmux.conf
- Las configuraciones de aplicaciones modernas, se situan dentro de '$HOME/.config', como: ~/.config/nvim/, ~/.config/alacritty/, ~/.config/hyper/
- Se ignoran archivos sensibles: ~/.ssh/*, ~/.gnupg/*, contraseñas, claves privadas.
- Se ignoran otros ficheros temporales, de caché o que no nos interesa guardar.

## 🌿 Ramas por máquina

Si tienes configuraciones específicas para diferentes equipos (portatil, sobremesa, servidor):

```bash
    config checkout -b portatil
```

Los cambios comunes pueden mantenerse en main y luego mergearse a las ramas locales de cada equipo.

## ⚙️ Añadir nuevos dotfiles

Se añaden gracias al alias que hemos creado, donde podemos usarlo en cualquier momento para añadir ficheros a nuestro repositorio de dotfiles.

Ejemplo del flujo de añadir un nuevo dotfile:

1. Añadir archivos al repositorio con add:

    ```bash
    config add ~/.vimrc
    config add ~/.config/alacritty/alacritty.yml
    ```

2. Hacemos commit:

    ```bash
    config commit -m "Añadir configuración de Alacritty y Vim"
    ```

3. Subir cambios a GitHub:

    ```bash
    config push
    ```

## 🔒 Seguridad

Como los archivos se agregan manualmente, no hace falta indicar en el fichero .gitignore aquello que no queremos que se mapee, pero se puede añadir como capa de seguridad extra.

Nunca se debe agregar a este repositorio archivos con contraseñas, claves privadas o información sensible.

## 📌 Referencias

- [ArchWiki: Dotfiles](https://wiki.archlinux.org/title/Dotfiles)
- [Atlassian: Managing dotfiles with bare Git repo](https://www.atlassian.com/git/tutorials/dotfiles)
- [What do you use to manage your dotfiles - Ask Hacker News](https://news.ycombinator.com/item?id=11071754)