{ config, pkgs, ... }:
{
	imports = [ ../themes/Dennis ];

	home = {
		username = "Dennis";
		homeDirectory = "/home/Dennis";

		stateVersion = "23.11";
		file = {};
		sessionVariables = {};
	};

	nixpkgs.config.allowUnfree = true;

	home.packages = (with pkgs; [
		webcord-vencord
		telegram-desktop
		obs-studio
		jetbrains.webstorm
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

		yaru-theme
		bibata-cursors
		tokyo-night-gtk
	]);
}
