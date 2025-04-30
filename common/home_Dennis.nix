{ config, pkgs, inputs, ... }:
{
	programs.nix-ld.enable = true;
	programs.nix-ld.libraries = with pkgs; [
		libGL
		mesa
	];

	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = true;
		localNetworkGameTransfers.openFirewall = true;

		# gamescopeSession.enable = true;
	};

	home-manager.users.Dennis = {
		imports = [ 
			../themes/Dennis
		];

		home = {
			username = "Dennis";
			homeDirectory = "/home/Dennis";

			stateVersion = "24.05";
			file = {};
			sessionVariables = {};
		};

		# nixpkgs.config.allowUnfree = true;
		home.packages = (with pkgs; [
			# === GUI ===
			# communication
			webcord-vencord
			discord-canary
			zoom-us
			telegram-desktop
			signal-desktop
			simplex-chat-desktop
			# Creator
			# blender
			# aseprite
			obs-studio
			obsidian
			reaper
			# System
			lact
			mpv
			libsForQt5.gwenview
			libsForQt5.dolphin
			nautilus
			gnome-sound-recorder
			file-roller
			rofi-wayland
			wlogout
			qpwgraph
			pavucontrol
			# e.t.c.
			sniffnet
			localsend
			brave
			# qbittorrent
			# protonvpn-gui
			heaptrack

			(renderdoc.override { waylandSupport = true; })
			# Games
			lutris
			bottles
			prismlauncher
			r2modman
			vintagestory

			# === CLI ===
			neofetch
			onefetch
			bat
			xdg-user-dirs
			zoxide
			nh
			gitleaks
			speedtest-rs
			swaylock
			swaynotificationcenter
			swww
			cava
			imagemagick
			ffmpeg
			yt-dlp
			ani-cli
			brightnessctl
			steamcmd
			steam-tui
			wineWowPackages.stableFull
			winetricks
			ventoy

			# System
			flatpak
			slurp
			grim
			fzf
			fd
			pamixer
			weather
			mpc
			# System/Service
			wl-clipboard

			# Temp
			ncmpcpp

			# Themes
			bibata-cursors
		]);
	};
}
