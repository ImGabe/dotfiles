#! /usr/bin/env nix-shell
#! nix-shell -I "nixpkgs=channel:nixpkgs-unstable" -i "make -f" -p gnumake nixUnstable

NIX_FLAGS := --experimental-features 'nix-command flakes'

update:
	nix $(NIX_FLAGS) flake update --commit-lock-file

gxbe:
	sudo nixos-rebuild switch --flake '.#gxbe'

rpi4:
	sudo nix build .#rpi4

