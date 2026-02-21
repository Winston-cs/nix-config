# NixOS Configuration Utility Guide

This document provides a technical breakdown of the features and packages included in this NixOS configuration. Use this as a reference for exactly what is installed and how it is structured.

## 🖥️ Desktop Environments & Window Managers
The configuration supports multiple graphical environments, toggled via `my.desktops.<name>.enable`:
- **Niri:** Scrollable tiling Wayland compositor (Active on ROG).
- **Cosmic:** Rust-based desktop environment (Active on Nvidia-PC).
- **Hyprland:** Dynamic tiling Wayland compositor.
- **Plasma:** KDE Desktop Environment.
- **Login Managers:** `ly` (TUI) or `sddm` (GUI).

### Desktop Components (Wayland)
- **Waybar:** Status bar.
- **SwayNC:** Notification daemon.
- **Swaylock:** Screen locker.
- **Wlogout:** Logout menu.
- **Xremap:** Key remapping utility.
- **XDG Portals:** `xdg-desktop-portal-gtk`, `xdg-desktop-portal-wlr`.

---

## 💻 CLI & Development Environment
Enabled via `my.apps.programming.enable`.

### Shell & Core Utilities
- **Zsh:** Main shell with `autosuggestion`, `syntaxHighlighting`, and `viins` keymap.
- **Starship:** Customizable shell prompt.
- **Zoxide:** Smart `cd` replacement.
- **Eza:** Modern `ls` replacement with icons.
- **Fzf:** Fuzzy finder.
- **Carapace:** Multi-shell command completion.
- **Ripgrep:** Fast search tool.

### Terminal & Multiplexers
- **Kitty:** Main terminal emulator (GPU accelerated, 0.85 opacity).
- **Zellij:** Terminal multiplexer with custom layouts in `modules/apps/programming/zellij-files`.

### Version Control
- **Git:** Configured for `blank2121`.
- **Lazygit:** TUI for git.
- **Jujutsu (jj):** Next-gen VCS with `jjui`, `jj-fzf`, and `delta` for diffs.

### Programming Languages & Tools
- **Rust:** `cargo`, `clippy`, `rustfmt`, `rustc`, `rust-analyzer`, `bacon`.
- **Haskell:** `ghc`, `stack`, `cabal-install`, `hls`.
- **Node.js:** `nodejs_20`.
- **Other:** `gcc`, `gnumake`, `julia`, `openjdk`, `texliveFull`, `typst`, `typst-live`.
- **LSPs:** `nil` (Nix), `svelte-language-server`, `typescript-language-server`, `vscode-css-languageserver`, `superhtml`.

### System Utilities (CLI)
- **Monitoring:** `btop`, `nix-output-monitor`, `dua`, `dust`.
- **Network:** `nmap`, `wget`, `gnupg`.
- **File Management:** `bat`, `fd`, `jq`, `trash-cli`, `pandoc`, `glow`, `gum`, `mprocs`.

---

## 🎮 Gaming
Enabled via `my.apps.gaming.<app>.enable`.
- **Steam:** With `gamescope` and `gamemode` enabled.
- **Tools:** `mangohud`, `protonup`.
- **Launchers:** `lunar-client` (Minecraft), `prismlauncher`.
- **Specific Games:** Honkai: Star Rail (`hsr`).

---

## 🎨 GUI Applications
Enabled via `my.apps.<app>.enable`.
- **Browsers:** `zen-browser`.
- **Communication:** `discord`, `zoom`, `thunderbird` (Email).
- **Productivity:** `obsidian`, `libreoffice`, `anki`.
- **Media:** `mpv`, `spotify`.
- **Creative:** `krita`, `darktable` (Photo).

---

## ⚙️ System Services
- **Audio:** Pipewire-based stack.
- **Bluetooth:** Enabled via `bluez`.
- **Printing:** `CUPS` with `hplip` support.
- **Storage:** `udisks2` for auto-mounting.
- **Styling:** `Stylix` managing system-wide themes (currently `kanagawa`).

---

## 📁 File Structure Reference
- `/hosts/`: Host-specific toggles and hardware configs.
- `/modules/apps/`: Individual application configurations.
- `/modules/desktops/`: Desktop environment logic and components.
- `/modules/system/`: Core OS services and hardware settings.
- `/scripts/`: Custom utility scripts integrated via `app-maker.nix`.
