{ config, pkgs, inputs, ... }:
{
	xdg.portal = {
		enable = true;
		xdgOpenUsePortal = false;
		extraPortals = with pkgs; [ 
			xdg-desktop-portal-gtk
			xdg-desktop-portal-hyprland
			xdg-desktop-portal-wlr
		];
		config.common.default = "*";
	};
	services.dbus.implementation = "broker";
	services.dbus.packages = with pkgs; [
		# gcr gnome.gnome-settings-daemon
		gcr gnome-settings-daemon
	];
	environment.variables = {
		DISPLAY = "";
		MOZ_ENABLE_WAYLAND="0";
	};
}
