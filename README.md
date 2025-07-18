# helia 2025 arch rice

![25CONF](https://github.com/user-attachments/assets/3ba65199-6cd4-47e0-8fa6-5f42bd1f0b4e)

welcome to my 2025 rice repository! feel free to look around at what I use to rice my Arch(btw) install.

THIS IS BASICALLY A FORK OF [Zenities Hyrland](https://github.com/hayyaoe/zenities). 

I started ricing on Fedora then on Arch because of this rice! 

---
## System Details
I run a Lenovo Thinkpad T450s with an i7-5600U.

- OS: Arch Linux (obv)
- DE: Hyprland
- Term: kitty
- Shell: bash w/ starship prompt
---
## WHAT IS NEEDED IN THIS RICE
1) hyprland stuff - (hyprpaper, hypridle, hyprlock)
2) pywal - consistent colors
3) waybar - status bar
4) wofi - app aluncher
5) dolphin - file manager

## APPS I NEED
1) neovim
(some plugins: lazynvim, telescope, treesitter, neotree, nvimnio, nvim-dap)
2) VSCodium
3) Spotify
4) Dicord

---
## Keybinds

### Launch Applications

| Action                 | Keybind                    | Description                          |
|------------------------|----------------------------|--------------------------------------|
| Terminal (tiled)       | `SUPER + RETURN`           | Launch terminal with `tmux`          |
| Browser                | `SUPER + B`                | Launch your default browser          |
| App Launcher / Menu    | `SUPER + R`                | Launch application menu (`$menu`)    |

---

### System Scripts

| Action                  | Keybind                  | Description                            |
|-------------------------|--------------------------|----------------------------------------|
| Select Wallpaper        | `SUPER + W`              | Run wallpaper selector script          |

---

### Window Actions

| Action            | Keybind           | Description                           |
|-------------------|-------------------|---------------------------------------|
| Kill Window       | `SUPER + Q`       | Close the currently focused window    |
| Toggle Floating   | `SUPER + F`       | Toggle floating mode for active window|
| Toggle Split      | `SUPER + J`       | Toggle split orientation (vertical/horizontal) |

---

### Window Focus
Use `SUPER + [key]` to change focus between tiled windows:

| Direction | Keybind     |
|-----------|-------------|
| Left      | `SUPER + left`   |
| Right     | `SUPER + right`   |
| Up        | `SUPER + up`   |
| Down      | `SUPER + down`   |

---

### Move Tiled Window
Use `ALT + SHIFT + [key]` to move a focused window in the specified direction:

| Direction | Keybind         |
|-----------|-----------------|
| Left      | `SUPER + SHIFT + left` |
| Right     | `SUPER + SHIFT + right` |
| Up        | `SUPER + SHIFT + up` |
| Down      | `SUPER + SHIFT + down` |

---

### Resize Tiled Window
Use `SUPER + ALT + [key]` to resize the focused window:

| Direction | Keybind              | Action       |
|-----------|----------------------|--------------|
| Shrink ←  | `SUPER + ALT + left` | Resize left  |
| Expand →  | `SUPER + ALT + right`| Resize right |
| Shrink ↑  | `SUPER + ALT + up`   | Resize up    |
| Expand ↓  | `SUPER + ALT + down` | Resize down  |

---

### Move Floating Window
Use `SUPER + CTRL + [key]` to move floating windows:

| Direction | Keybind              |
|-----------|----------------------|
| Left      | `SUPER + CTRL + left`|
| Right     | `SUPER + CTRL + right`|
| Up        | `SUPER + CTRL + up`  |
| Down      | `SUPER + CTRL + down`|

---

## Credits
- **[haya/hayyaoe](https://github.com/hayyaoe)**
- **[cxOrz (for waybar)](https://github.com/cxOrz/dotfiles-hyprland)**
- **[LierB / Bina (for waybar colors | pywal)](https://github.com/LierB/dotfiles)**
