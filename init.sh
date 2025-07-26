#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p ~/.config
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true
mv ~/.config/tmux ~/.config/tmux.backup 2>/dev/null || true
mv ~/.bashrc ~/.bashrc.backup 2>/dev/null || true
mv ~/.wezterm.lua ~/.wezterm.lua.backup 2>/dev/null || true
ln -sf "$SCRIPT_DIR/nvim" ~/.config/nvim
ln -sf "$SCRIPT_DIR/tmux" ~/.config/tmux
ln -sf "$SCRIPT_DIR/.bashrc" ~/.bashrc
ln -sf "$SCRIPT_DIR/.wezterm.lua" ~/.wezterm.lua
