{ config, pkgs, inputs, ... }:
{

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
			gimp
			wineWowPackages.waylandFull

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
			brightnessctl
			mangohud
			steamcmd
			steam-tui

			# Themes
			bibata-cursors
		]);
	};
}
