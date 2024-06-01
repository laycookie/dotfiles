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

  home.sessionVariables = {
	"QT_STYLE_OVERRIDE"="kvantum";
  };
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
		gnome.nautilus
		libsForQt5.qtstyleplugin-kvantum
		libsForQt5.dolphin
		rofi-wayland
		wlogout
		helvum
		pavucontrol
		gnome.file-roller
		steam
		blender
		qbittorrent
		localsend

		# CLI
		neofetch
		onefetch
		bat
		zoxide
		fzf
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
		bibata-cursors
	]);


	imports = [ ../themes/Dennis ];
}
