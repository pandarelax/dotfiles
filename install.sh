#!/usr/bin/env bash
set -e

DOTFILES="$HOME/dotfiles"

# Backup mevcut konfigürasyonlar
for file in .zshrc .gitconfig aliases.zsh; do
  [[ -e "$HOME/$file" ]] && mv "$HOME/$file" "$HOME/${file}.bak"
done

# Symlink oluştur
ln -sf "$DOTFILES/.zshrc" "$HOME/.zshrc"
ln -sf "$DOTFILES/gitconfig" "$HOME/.gitconfig"
# ln -sf "$DOTFILES/aliases.zsh" "$HOME/aliases.zsh"
ln -sf "$DOTFILES/starship.toml" "$HOME/.config/starship.toml"

# WezTerm config klasörü
mkdir -p "$HOME/.config/wezterm"
ln -sf "$DOTFILES/wezterm/wezterm.lua" "$HOME/.config/wezterm/wezterm.lua"

echo "Symlink’ler oluşturuldu."
