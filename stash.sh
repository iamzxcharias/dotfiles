#!/bin/bash

# Backup-Ordner mit Zeitstempel erstellen, damit nichts überschrieben wird
BACKUP_DIR=~/.dotfiles_backup/$(date +%Y-%m-%d_%H-%M-%S)
mkdir -p ~/.config
mkdir -p "$BACKUP_DIR"

echo "Erstelle Backups in $BACKUP_DIR (falls echte Dateien existieren)..."

# 1. Backup & Link für Neovim (kompletter Ordner)
if [ -e ~/.config/nvim ] && [ ! -L ~/.config/nvim ]; then
    mv ~/.config/nvim "$BACKUP_DIR/" 2>/dev/null
fi
# -sfn überschreibt bestehende Links sauber
ln -sfn ~/dotfiles/nvim ~/.config/nvim

# 2. Backup & Link für Kitty (kompletter Ordner für Themes!)
if [ -e ~/.config/kitty ] && [ ! -L ~/.config/kitty ]; then
    mv ~/.config/kitty "$BACKUP_DIR/" 2>/dev/null
fi
ln -sfn ~/dotfiles/kitty ~/.config/kitty

# 3. Backup & Link für ZSH (.zshrc)
if [ -e ~/.zshrc ] && [ ! -L ~/.zshrc ]; then
    mv ~/.zshrc "$BACKUP_DIR/" 2>/dev/null
fi
ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc

# 3.5 Backup & Link für Powerlevel10k (.p10k.zsh)
# Falls Zsh eine Standard-Datei generiert hat, wird sie gesichert/entfernt
if [ -e ~/.p10k.zsh ] && [ ! -L ~/.p10k.zsh ]; then
    mv ~/.p10k.zsh "$BACKUP_DIR/" 2>/dev/null
fi
# Wir nehmen an, deine .p10k.zsh liegt ebenfalls im zsh-Ordner
ln -sf ~/dotfiles/zsh/.p10k.zsh ~/.p10k.zsh

# 4. Backup & Link für TMUX
if [ -e ~/.tmux.conf ] && [ ! -L ~/.tmux.conf ]; then
    mv ~/.tmux.conf "$BACKUP_DIR/" 2>/dev/null
fi
ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf

echo "Dotfiles wurden erfolgreich verlinkt!"
