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
			# GUI
			webcord-vencord
			discord-canary
			zoom-us
			telegram-desktop
			signal-desktop
			simplex-chat-desktop
			obs-studio
			obsidian
			mpv
			libsForQt5.gwenview
			brave
			thunderbird
			# gnome.gnome-sound-recorder
			# gnome.nautilus
			# gnome.file-roller
			gnome-sound-recorder
			nautilus
			file-roller
			libsForQt5.qtstyleplugin-kvantum
			libsForQt5.dolphin
			rofi-wayland
			wlogout
			helvum
			qpwgraph
			pavucontrol
			# blender
			# qbittorrent
			localsend
			lutris
			prismlauncher
			bottles
			# aseprite
			wineWowPackages.waylandFull
			protonvpn-gui
			heaptrack
			vscode
			(renderdoc.override { waylandSupport = true; })

			# CLI
			neofetch
			onefetch
			bat
			xdg-user-dirs
			zoxide
			fzf
			fd
			gitleaks
			speedtest-rs
			swaylock
			swaynotificationcenter
			swww
			cava
			mpd
			imagemagick
			ffmpeg
			yt-dlp
			ani-cli
			brightnessctl
			steamcmd
			steam-tui
			flatpak

			# TEMP
			slurp
			grim

			# Themes
			bibata-cursors
		]);
	};
}
