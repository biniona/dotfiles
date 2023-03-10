#!/bin/bash

# check if vscode is installed
function vscode_check_install {
  readonly expected_dir="$HOME/Library/Application Support/Code"
  if [ ! -d "$expected_dir" ] 
  then
      echo "VSCode may not be installed. Directory $expected_dir does not exist." 
      kill -PID
  fi
}

function vscode_open_settings {
  vscode_check_install
  code "$HOME/Library/Application Support/Code/User/settings.json"
}

### Helpers for saving and restoring settings and keybindings
function vscode_save_settings {
  vscode_check_install
  cp "$HOME/Library/Application Support/Code/User/settings.json" "$HOME/.vscode_configs"
}

function vscode_restore_settings {
  vscode_check_install
  cp "$HOME/.vscode_configs/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
}

function vscode_save_keybindings {
  vscode_check_install
  cp "$HOME/Library/Application Support/Code/User/keybindings.json" "$HOME/.vscode_configs"
}

function vscode_restore_keybindings {
  vscode_check_install
  cp "$HOME/.vscode_configs/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
}

function vscode_save_config {
  vscode_save_settings
  vscode_save_keybindings
}

function vscode_restore_config {
  vscode_restore_settings
  vscode_restore_keybindings
}
###