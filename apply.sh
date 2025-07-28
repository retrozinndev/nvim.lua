#!/bin/bash

set -e

if [[ -z "$XDG_CONFIG_HOME" ]]; then
    XDG_CONFIG_HOME="$HOME/.config"
fi

NEOVIM_CONFIG_HOME="$XDG_CONFIG_HOME/nvim"
CONFIG_BACKUP_HOME="$XDG_CONFIG_HOME/nvim-bkp"


echo "##############################"
echo "## retrozinndev's nvim dots ##"
echo "##############################"
printf "\n"

printf "You can cancel before installation starts with: ^C ([Ctrl] + [C])\n"

printf "Starting installation in: "
sleep 1
echo -n "3"
sleep 1
echo -n ", 2"
sleep 1
echo -ne ", 1...\n"
sleep 1

echo "[info] starting installation"
mkdir -p "$NEOVIM_CONFIG_HOME"

if [[ ! -z $(ls -A "$NEOVIM_CONFIG_HOME") ]]; then 
    if [[ -d $CONFIG_BACKUP_HOME ]]; then
	read -n 1 -a '(y n)' -p "[warn] backup directory already exists, move it to trash? (if no, then skip backup) [y/n]" answer
	printf '\n'
	case "$answer" in
	    y)
		echo "[info] moving backup to trash with trash-put"
		trash-put "$CONFIG_BACKUP_HOME" || echo "[error] couldn't use trash-cli, moving manually instead" && \
		    mkdir -p "$HOME/.local/share/Trash" && mv "$CONFIG_BACKUP_HOME" "$HOME/.local/share/Trash"
		;;
	    n)
		echo "[info] ok, skipping backup then"
		;;
	    *)
		echo "[error] this is not a valid answer! quitting..."
		exit 1
	esac
    fi

    echo "[info] making backup folder in ´$CONFIG_BACKUP_HOME´..."
    mkdir -p "$CONFIG_BACKUP_HOME" 
    echo "[info] copying previous files to backup folder";
    mv -rf $NEOVIM_CONFIG_HOME/* "$CONFIG_BACKUP_HOME"
fi

printf "\n"

echo "[info] applying new config in `$NEOVIM_CONFIG_HOME`"
echo " -> copying files..."
cp -rf ./config/* "$NEOVIM_CONFIG_HOME"

printf "\n"

echo "[finish] Done! The config is ready to be used, now run neovim and enjoy!"

printf "\n"

exit 0
