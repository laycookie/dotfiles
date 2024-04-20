{ config, pkgs, ... }:
{
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
		steam
		gparted
		libsForQt5.dolphin
		rofi-wayland
		wlogout
		helvum
		pavucontrol
		ark

		# CLI
		neofetch
		onefetch
		bat
		zoxide
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

		# Themes
		yaru-theme
		bibata-cursors
		tokyo-night-gtk
	]);
	imports = [ ../themes/Dennis ];
}
