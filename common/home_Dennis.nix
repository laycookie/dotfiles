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

		nixpkgs.config.allowUnfree = true;
		home.packages = (with pkgs; [
			# GUI
			webcord-vencord
			zoom-us
			telegram-desktop
			signal-desktop
			simplex-chat-desktop
			obs-studio
			gnome.gnome-sound-recorder
			obsidian
			mpv
			libsForQt5.gwenview
			brave
			thunderbird
			gnome.nautilus
			libsForQt5.qtstyleplugin-kvantum
			libsForQt5.dolphin
			rofi-wayland
			wlogout
			helvum
			pavucontrol
			gnome.file-roller
			blender
			qbittorrent
			localsend
			lutris
			bottles
			aseprite
			wineWowPackages.waylandFull
			protonvpn-gui

			# CLI
			neofetch
			onefetch
			bat
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
			mangohud
			steamcmd
			steam-tui

			# TEMP
			slurp
			grim

			# Themes
			bibata-cursors
		]);
	};
}
