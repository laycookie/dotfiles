{ config, pkgs, ... }:
{
	programs.steam = {
		enable = true;
		remotePlay.openFirewall = true;
		dedicatedServer.openFirewall = true;
		localNetworkGameTransfers.openFirewall = true;

		gamescopeSession.enable = true;
	};
	programs.nix-ld.enable = true;

	home-manager.users.Dennis = {
		home = {
			username = "Dennis";
			homeDirectory = "/home/Dennis";

			stateVersion = "23.11";
			file = {};
			sessionVariables = {};
		};

		nixpkgs.config.allowUnfree = true;

		home.packages = (with pkgs; [
			# GUI
			webcord-vencord
			telegram-desktop
			signal-desktop
			obs-studio
			obsidian
			mpv
			libsForQt5.gwenview
			brave
			thunderbird
			gparted
			nautilus
			libsForQt5.qtstyleplugin-kvantum
			libsForQt5.dolphin
			rofi-wayland
			wlogout
			helvum
			pavucontrol
			file-roller
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


		imports = [ ../themes/Dennis ];
	};
}
