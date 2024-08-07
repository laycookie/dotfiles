{ config, pkgs, inputs, ... }:
{
	# programs.hyprland = {
	#   enable = true;
	# };

	# imports = with inputs.niri; [ homeModules.stylix homeModules.niri ];
	# stylix.targets.niri.enable = true;
	# programs.niri.enable = true;

	# wayland.windowManager.river.enable = true;
	# wayland.windowManager.river.systemd.enable = true;

	# technicly a dublicate
	# wayland.windowManager.hyprland.enable = true;
	# wayland.windowManager.hyprland.systemd.enable = true;

	# xdg.portal.xdgOpenUsePortal = false;
	# xdg.portal.extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
	# services.dbus.implementation = "broker";
	# services.dbus.packages = with pkgs; [
	# 	gcr gnome.gnome-settings-daemon
	# ]; 

  # environment.sessionVariables = {
  home.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint Electron apps to use wayland
    NIXOS_OZONE_WL = "1";
    "MOZ_ENABLE_WAYLAND" = "1"; # for firefox to run on wayland
    "MOZ_WEBRENDER" = "1";
    # for hyprland with nvidia gpu, ref https://wiki.hyprland.org/Nvidia/ I think this caused SDDM to not work.
    "LIBVA_DRIVER_NAME" = "nvidia";
    "GBM_BACKEND" = "nvidia-drm";
    "__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
    "WLR_EGL_NO_MODIFIRES" = "1"; 
  };
}
