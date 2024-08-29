{ config, pkgs, inputs, ... }:
{
	xdg.portal.xdgOpenUsePortal = false;
	xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
	services.dbus.implementation = "broker";
	services.dbus.packages = with pkgs; [
		gcr gnome.gnome-settings-daemon
	]; 
}
