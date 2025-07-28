#!/bin/bash

set -e

if [[ -z "$XDG_CONFIG_HOME" ]]; then
    XDG_CONFIG_HOME="$HOME/.config"
fi

NEOVIM_CONFIG_HOME="$XDG_CONFIG_HOME/nvim"

echo "[warn] this script is used to update the repo with current user configuration. PLEASE RUN THIS INSIDE THE REPOSITORY DIRECTORY"
echo "[tip] press ^C ([Ctrl] + [C]) to quit the script."
echo "waiting 5 seconds to start... (skip by pressing any key)"
read -t 5 -n 1

printf "\n"

echo "[info] deleting current repo's configuration"
rm -rf ./config

echo "[info] copying user nvim configuration to current dir"
mkdir ./config
cp -r $NEOVIM_CONFIG_HOME/* ./config

if command -v git > /dev/null; then
    git status && printf '\n'
fi

echo "Done, have a great day!"
